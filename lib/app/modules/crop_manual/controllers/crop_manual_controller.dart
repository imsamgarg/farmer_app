import 'package:farmer_app/app/modules/crop_manual/views/manual_view.dart';
import 'package:get/get.dart';

class CropManualController extends GetxController {
  void onDiseaseSelect(int i, int j) {
    Get.to(() => ManualView());
  }

  void nextInfo() {}
}
