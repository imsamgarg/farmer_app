import 'package:farmer_app/app/data/services/auth_service.dart';
import 'package:get/get.dart';

import '../controllers/startup_controller.dart';

class StartupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthService>(AuthService());
    Get.put<StartupController>(StartupController());
  }
}
