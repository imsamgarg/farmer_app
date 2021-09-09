import 'package:get/get.dart';

import '../controllers/disease_detection_controller.dart';

class DiseaseDetectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiseaseDetectionController>(
      () => DiseaseDetectionController(),
    );
  }
}
