import 'package:get/get.dart';

import 'package:farmer_app/app/modules/disease_detection/controllers/camera_controller.dart';

import '../controllers/disease_detection_controller.dart';

class DiseaseDetectionBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<CameraViewController>(
    //   () => CameraViewController(),
    // );
    Get.lazyPut<DiseaseDetectionController>(
      () => DiseaseDetectionController(),
    );
  }
}
