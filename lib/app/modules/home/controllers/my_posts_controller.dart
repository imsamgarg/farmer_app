import 'package:get/get.dart';

class MyPostsController extends GetxController {
  //TODO: Implement MyPostsController

  final count = 0.obs;

  var scrollController;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
