import 'package:farmer_app/app/modules/home/controllers/profile_controller.dart';
import 'package:get/get.dart';

import 'package:farmer_app/app/modules/home/controllers/notification_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<NotificationController>(
      () => NotificationController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
