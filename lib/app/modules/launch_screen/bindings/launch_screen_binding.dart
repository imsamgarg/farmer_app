import 'package:farmer_app/app/modules/launch_screen/controllers/get_started_controller.dart';
import 'package:get/get.dart';
import '../controllers/launch_screen_controller.dart';

class LaunchScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaunchScreenController>(
      () => LaunchScreenController(),
    );
    Get.lazyPut<GetStartedControllerController>(
      () => GetStartedControllerController(),
    );
  }
}
