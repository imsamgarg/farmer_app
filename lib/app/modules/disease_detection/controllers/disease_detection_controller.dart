import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/data/models/post_model.dart';
import 'package:farmer_app/app/modules/disease_detection/controllers/camera_controller.dart';
import 'package:farmer_app/app/modules/disease_detection/views/camera_view.dart';
import 'package:farmer_app/app/modules/disease_detection/views/disease_detection_view.dart';
import 'package:farmer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiseaseDetectionController extends GetxController {
  late XFile image;

  late final GlobalKey<FormState> formKey = GlobalKey();

  late final desController = TextEditingController();
  late final nameController = TextEditingController();

  void onSubmit() {
    Get.to(
      () => CameraView(),
      binding: BindingsBuilder.put(() => CameraViewController()),
    );
  }

  bool isButtonLoading = false;

  final buttonLoadingId = "button";

  late final user = getAuth().currentUser;

  String? get picture => user?.photoURL;
  String get name => user?.displayName ?? "Your Name";
  // String get imageName => image.path;

  void createPost() async {
    if (!formKey.currentState!.validate()) return;

    toggleButtonLoading(true);
    final time = Timestamp.now();
    try {
      final content =
          'Crop Name: ${nameController.text}\n${desController.text}';
      var _image = this.image.path;
      _image = await getStorageService().savePostImage(_image, user!.uid);
      final post = Post(
        createdAt: time,
        updatedAt: time,
        category: 'Disease',
        content: content,
        image: _image,
        username: user!.displayName,
        profileImage: user!.photoURL,
        user: user!.uid,
      );
      await getDbService().createPost(post);
      Get.until((route) => Get.currentRoute == Routes.HOME);
      successSnackbar("Post Created Successfully!!");
    } on Exception catch (e, s) {
      errorSnackbar("Error Creating Post");
    } finally {
      toggleButtonLoading(false);
    }
  }

  void toggleButtonLoading(bool value) {
    isButtonLoading = value;
    update([buttonLoadingId]);
  }

  void onReqSubmit() => createPost();
}
