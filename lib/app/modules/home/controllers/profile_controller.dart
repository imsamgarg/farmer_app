import 'package:custom_utils/log_utils.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/data/models/profile_model.dart';
import 'package:farmer_app/app/data/services/db_service.dart';
import 'package:farmer_app/app/modules/home/controllers/user_controller.dart';
import 'package:farmer_app/app/modules/home/views/logout_confirm_dialog_view.dart';
import 'package:farmer_app/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:farmer_app/app/modules/home/views/edit_profile_view.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  late final Profile profile;
  late final User _user;
  late final DatabaseService _databaseService;

  late final TextEditingController nameController;
  late final TextEditingController addressController;
  XFile? image;
  XFile? uploadedImage;

  late final instance = _fetchData();

  bool isEditButtonLoading = false;
  final _editingEnabled = false.obs;

  late final formKey = GlobalKey<FormState>();
  late final userController = Get.find<UserController>();

  final String imageId = "profile-image";
  final String loadingButtonId = "loading-button";

  bool get editingEnabled => this._editingEnabled.value;
  set editingEnabled(value) => this._editingEnabled.value = value;

  String get name => _user.displayName ?? "";
  String get number => _user.phoneNumber ?? "";
  String get profileImage => _user.photoURL ?? "";

  late String _oldName;
  late String _oldAddress;

  Future<bool> _fetchData() async {
    _databaseService = getDbService();
    _user = getAuth().currentUser!;
    profile = await _databaseService.getProfile(_user.uid);
    _oldName = _user.displayName!;
    _oldAddress = profile.address!;
    nameController = TextEditingController(text: _user.displayName);
    addressController = TextEditingController(text: profile.address);
    return true;
  }

  void gotoToEditProfile() {
    Get.to(() => EditProfileView());
  }

  void logout() {
    Get.dialog(LogoutConfirmDialog());
  }

  void confirmLogout() async {
    final service = getAuth();
    await service.signOut();
    return Get.offAllNamed(Routes.WELCOME);
  }

  void editProfile() async {
    if (editingEnabled) {
      try {
        if (!formKey.currentState!.validate()) return;
        toggleLoadingButton(true);
        await _changeName();
        await _changeAddress();
        await _changeImage();
        editingEnabled = false;
        successSnackbar("Profile Updated");
        toggleLoadingButton(false);
      } on Exception catch (e) {
        toggleLoadingButton(false);
        errorSnackbar("Failed To Update Profile");
      }
    } else {
      editingEnabled = true;
    }
  }

  void toggleLoadingButton(bool value) {
    isEditButtonLoading = value;
    update([loadingButtonId]);
  }

  Future<void> _changeName() async {
    if (nameController.text != _oldName) {
      await getAuthService().changeName(nameController.text);
      _oldName = nameController.text;
      userController.changeName(nameController.text);
    }
  }

  Future<void> _changeImage() async {
    if (image != null && uploadedImage != image) {
      try {
        final url = await getStorageService().saveProfileImage(
          image!.path,
          _user.uid,
        );
        await getAuthService().changeDp(url);
        userController.changeDp(url);
        uploadedImage = image;
      } on Exception catch (e) {
        errorSnackbar("Failed To Upload Image");
      }
    }
  }

  Future<void> _changeAddress() async {
    if (addressController.text != _oldAddress) {
      await getDbService().updateProfile(
        _user.uid,
        Profile(address: addressController.text),
      );
      _oldAddress = addressController.text;
    }
  }

  void changePicture() async {
    this.image = await getNativeService().pickImageFromGallery();
    if (image != null) {
      update([imageId]);
    }
  }
}
