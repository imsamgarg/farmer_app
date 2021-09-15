import 'package:farmer_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

import 'package:farmer_app/app/modules/home/views/edit_profile_view.dart';

class ProfileController extends GetxController {
  void editProfile() {
    Get.to(EditProfileView());
  }

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
}
