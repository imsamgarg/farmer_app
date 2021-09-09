import 'package:get/get.dart';
import '../controllers/launch_screen_controller.dart';

class LaunchScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaunchScreenController>(
      () => LaunchScreenController(),
    );
  }
}
