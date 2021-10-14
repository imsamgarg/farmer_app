import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_utils/log_utils.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/data/models/post_model.dart';
import 'package:farmer_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostController extends GetxController {
  // late final instance = _getData();
  late final user = getAuth().currentUser;

  bool isButtonLoading = false;

  late List<String> categories = Get.find<HomeController>().categories;
  // late final selectedCategory = RxnInt(null);

  final RxnInt _selectedCategory = RxnInt(null);
  get selectedCategory => this._selectedCategory.value;
  set selectedCategory(value) => this._selectedCategory.value = value;

  XFile? image;

  final buttonLoadingId = "button";
  final imageNameId = "image-name";

  late final postSummaryController = TextEditingController();
  late final formKey = GlobalKey<FormFieldState>();

  String? get picture => user?.photoURL;
  String get name => user?.displayName ?? "Your Name";
  String get imageName => image?.path ?? "";

  void createPost() async {
    if (!formKey.currentState!.validate()) return;
    if (selectedCategory == null) {
      errorSnackbar("Please Select Category");
      return;
    }
    toggleButtonLoading(true);
    final time = Timestamp.now();
    try {
      var _image = this.image?.path;
      if (_image != null) {
        _image = await getStorageService().savePostImage(_image, user!.uid);
      }
      final post = Post(
        createdAt: time,
        updatedAt: time,
        category: categories[selectedCategory],
        content: postSummaryController.text,
        image: _image,
        profileImage: user!.photoURL,
        user: user!.uid,
      );
      await getDbService().createPost(post);
      _resetPage();
      successSnackbar("Post Created Successfully!!");
    } on Exception catch (e, s) {
      customLog("Error", name: "Post", error: e, stackTrace: s);
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

  void selectCategory(int i) {
    selectedCategory = i;
  }

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

  void _resetPage() {
    image = null;
    update([imageNameId]);
    selectedCategory = null;
    postSummaryController.clear();
  }
}
