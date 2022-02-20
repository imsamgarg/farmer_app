import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/data/models/post_model.dart';
import 'package:farmer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SellProduceController extends GetxController {
  late final user = getAuth().currentUser;

  bool isButtonLoading = false;

  XFile? image;

  final buttonLoadingId = "button";
  final imageNameId = "image-name";

  late final formKey = GlobalKey<FormState>();

  late final TextEditingController desController = TextEditingController();

  late final TextEditingController nameController = TextEditingController();

  late final priceController = TextEditingController();

  String? get picture => user?.photoURL;

  String get name => user?.displayName ?? "Your Name";
  String get imageName => image?.path ?? "";

  void createPost() async {
    if (!formKey.currentState!.validate()) return;
    // if (selectedCategory == null) {
    //   errorSnackbar("Please Select Category");
    //   return;
    // }
    toggleButtonLoading(true);
    final time = Timestamp.now();
    try {
      var _image = this.image?.path;
      if (_image != null) {
        _image = await getStorageService().savePostImage(_image, user!.uid);
      }
      final price = priceController.text;
      final name = nameController.text;
      final des = desController.text;

      final number = user?.phoneNumber;
      final content =
          '$name \n\nPrice: $price \n\n$des \n\nPhone Number:$number';
      final post = Post(
        createdAt: time,
        updatedAt: time,
        category: 'Buy Crop',
        content: content,
        image: _image,
        username: user!.displayName,
        profileImage: user!.photoURL,
        user: user!.uid,
      );
      await getDbService().createPost(post);
      // _resetPage();
      Get.until((_) => Get.currentRoute == Routes.HOME);
      successSnackbar("Post Created Successfully!!");
    } on Exception catch (e) {
      errorSnackbar("Error Creating Post");
    } finally {
      toggleButtonLoading(false);
    }
  }

  // Future<bool> _getData() async {
  //   categories = await getDbService().getCategories();
  //   // selectedCategories = List.filled(categories.length, false.obs);
  //   return true;
  // }

  void toggleButtonLoading(bool value) {
    isButtonLoading = value;
    update([buttonLoadingId]);
  }

  void pickImage() async {
    image = await getNativeService().pickImageFromGallery();
    if (image != null) {
      update([imageNameId]);
    }
  }

  void onSubmit() => createPost();
}
