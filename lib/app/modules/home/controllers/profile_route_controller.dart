import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileRoutesController extends GetxController {
  void openWeatherReport() {
    Get.toNamed(Routes.WEATHER_REPORT);
  }

  void openDiseaseDetection() {
    Get.toNamed(Routes.DISEASE_DETECTION);
  }

  void openCropManual() {
    Get.toNamed(Routes.CROP_MANUAL);
  }

  void openBuyInput() {
    Get.toNamed(Routes.BUY_INPUT);
  }

  void openSellProduce() {
    Get.toNamed(Routes.SELL_PRODUCE);
  }

  void dummyButton() {
    errorSnackbar("Not Implemented");
  }
}
