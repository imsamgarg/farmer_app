import 'package:custom_utils/log_utils.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/core/utils/mixins.dart';
import 'package:farmer_app/app/modules/register/views/enter_name_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:farmer_app/app/modules/register/views/register_otp_view.dart';
import 'package:farmer_app/app/routes/app_pages.dart';

class RegisterController extends GetxController with Validators {
  late final phoneFormkey = GlobalKey<FormState>();
  late final otpFormKey = GlobalKey<FormState>();
  late final nameFormKey = GlobalKey<FormState>();

  late final phoneController = TextEditingController();
  late final otpController = TextEditingController();
  late final nameController = TextEditingController();
  late final auth = getAuth();

  //Otp Code
  late var verificationToken;

  bool sendOtpButtonLoading = false;
  bool enterOtpButtonLoading = false;
  bool enterNameButtonLoading = false;

  final String sendOtpButtonId = "button";
  final String enterOtpButtonId = "otp-button";
  final String enterNameButtonId = "enter-name-button";

  final successMsg = "Verification Successfull!!";

  @override
  void onClose() {
    customLog("Disposing Controllers", name: "Login");
    phoneController.dispose();
    otpController.dispose();
    customLog("Controllers Disposed", name: "Login");
    super.onClose();
  }

  ///Sending Otp Then Move To Otp Verification Screen
  void sendOtp() async {
    if (!phoneFormkey.currentState!.validate()) return;
    try {
      customLog(phoneController.text);
      toggleOtpButtonLoading(true);
      final number = "+91${phoneController.text}";
      await auth.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } on Exception catch (e, s) {
      customLog("Error", error: e, stackTrace: s);
      toggleOtpButtonLoading(false);
    }
    // toggleOtpButtonLoading(false);
  }

  ///Manual Otp Verification
  void validateOtp() async {
    if (!otpFormKey.currentState!.validate()) return;
    try {
      toggleEnterOtpButtonLoading(true);
      final otp = otpController.text;
      final creds = PhoneAuthProvider.credential(
        verificationId: verificationToken,
        smsCode: otp,
      );
      await _registerUser(creds);
    } on Exception catch (e) {
      toggleEnterOtpButtonLoading(false);
      errorSnackbar("Failed To Verify Number");
    }
  }

  ///Register User Name
  void registerUserName() async {
    try {
      if (!nameFormKey.currentState!.validate()) return;
      toggleEnterNameButtonLoading(true);
      final name = nameController.text;
      await auth.currentUser?.updateDisplayName(name);
      Get.offAllNamed(Routes.HOME);
    } on Exception catch (e, s) {
      customLog("__", name: "Name Error", error: e, stackTrace: s);
      errorSnackbar("Failed To Set Name");
    } finally {
      toggleEnterNameButtonLoading(false);
    }
  }

  ///Phone Auth Methods
  void verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
    otpController.text = phoneAuthCredential.smsCode ?? "";
    await _registerUser(phoneAuthCredential);
  }

//Register User To Firebase Auth
  Future<void> _registerUser(PhoneAuthCredential creds) async {
    final user = await auth.signInWithCredential(creds);
    final userInfo = user.additionalUserInfo;
    if (userInfo?.isNewUser ?? false) {
      Get.to(() => EnterNameView());
      await getDbService().createProfile(user.user?.uid ?? "");
    } else {
      Get.offAllNamed(Routes.HOME);
    }
    successSnackbar(successMsg);
  }

  void verificationFailed(FirebaseAuthException e) {
    // late var errorMsg;
    // = "Failed To Verify Number";
    if (e.code == 'invalid-phone-number') {
      var errorMsg = 'The provided phone number is not valid.';
      errorSnackbar(errorMsg);
    }
  }

  void codeSent(String id, int? rT) {
    toggleOtpButtonLoading(false);
    verificationToken = id;
    return moveToOtpView();
  }

  void codeAutoRetrievalTimeout(String verificationId) {}

  ///Utilty Methods
  void moveToOtpView() async {
    Get.to(() => RegisterOtpView());
  }

  void toggleOtpButtonLoading(bool value) {
    sendOtpButtonLoading = value;
    update([sendOtpButtonId]);
  }

  void toggleEnterOtpButtonLoading(bool value) {
    enterOtpButtonLoading = value;
    update([enterOtpButtonId]);
  }

  void toggleEnterNameButtonLoading(bool value) {
    enterNameButtonLoading = value;
    update([enterNameButtonId]);
  }
}
