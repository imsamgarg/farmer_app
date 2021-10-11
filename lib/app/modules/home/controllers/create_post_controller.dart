import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_utils/log_utils.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/data/models/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostController extends GetxController {
  late final instance = _getData();
  late final user = getAuth().currentUser;

  bool isButtonLoading = false;

  late List<String> categories;
  late List<RxBool> selectedCategories;

  XFile? image;

  final buttonLoadingId = "button";
  final imageNameId = "image-name";

  late final postSummaryController = TextEditingController();
  late final formKey = GlobalKey<FormFieldState>();

  String? get picture => user?.photoURL;
  String get name => user?.displayName ?? "Your Name";
  String get imageName => image?.name ?? "";

  void createPost() async {
    if (!formKey.currentState!.validate()) return;
    toggleButtonLoading(true);
    final time = Timestamp.now();
    try {
      final post = Post(
        createdAt: time,
        updatedAt: time,
        category: "",
        content: postSummaryController.text,
        image: image?.path,
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

  Future<bool> _getData() async {
    categories = await getDbService().getCategories();
    selectedCategories = List.filled(categories.length, false.obs);
    return true;
  }

  void selectCategory(int i) {
    selectedCategories[i].value = !selectedCategories[i].value;
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
    selectedCategories.forEach((element) {
      element.value = false;
    });
    postSummaryController.clear();
  }
}
