import 'package:get/get.dart';

import '../controllers/paddy_straw_management_controller.dart';

class PaddyStrawManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaddyStrawManagementController>(
      () => PaddyStrawManagementController(),
    );
  }
}
