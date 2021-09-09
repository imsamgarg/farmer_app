import 'package:get/get.dart';

import '../controllers/crop_manual_controller.dart';

class CropManualBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CropManualController>(
      () => CropManualController(),
    );
  }
}
