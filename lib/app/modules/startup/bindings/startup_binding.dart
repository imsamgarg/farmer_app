import 'package:farmer_app/app/data/services/auth_service.dart';
import 'package:farmer_app/app/data/services/db_service.dart';
import 'package:farmer_app/app/data/services/storage_service.dart';
import 'package:get/get.dart';

import '../controllers/startup_controller.dart';

class StartupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthService>(AuthService());
    Get.put<DatabaseService>(DatabaseService());
    Get.put<StorageService>(StorageService());
    Get.put<StartupController>(StartupController());
  }
}
