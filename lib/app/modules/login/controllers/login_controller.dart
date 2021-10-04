import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/core/utils/mixins.dart';
import 'package:firebase_auth_platform_interface/src/firebase_auth_exception.dart';
import 'package:firebase_auth_platform_interface/src/providers/phone_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:farmer_app/app/modules/login/views/otp_view.dart';
import 'package:farmer_app/app/routes/app_pages.dart';
import 'package:custom_utils/log_utils.dart';

class LoginController extends GetxController with Validators {
  late final formKey = GlobalKey<FormState>();
  late final otpformKey = GlobalKey<FormState>();

  late final phoneController = TextEditingController();
  late final otpController = TextEditingController();
  late final auth = getAuth();
  late final successMsg = "Verification Successfull!!";

  late var otp;
  void sendOtp() async {
    final number = "+91${phoneController.text}";
    await auth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  @override
  void onClose() {
    customLog("Disposing Controllers", name: "Login");
    phoneController.dispose();
    otpController.dispose();
    customLog("Controllers Disposed", name: "Login");
    super.onClose();
  }

  void validate() async {
    Get.toNamed(Routes.HOME);
  }

  String? phoneValidator(String? value) {
    return this.phoneNumberValidator(value, 11);
  }

  void verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
    otpController.text = phoneAuthCredential.smsCode ?? "";
    await auth.signInWithCredential(phoneAuthCredential);
    successSnackbar(successMsg);
  }

  void verificationFailed(FirebaseAuthException error) {
    var errorMsg = "Failed To Verify Number";
  }

  void codeSent(String id, int? rT) {
    otp = id;
    Get.to(OtpView());
  }

  ////TODO: Dont knw what to do
  void codeAutoRetrievalTimeout(String verificationId) {}

  String? otpValidator(String? value) {
    return this.otpCodeValidator(value, 6);
  }
}
