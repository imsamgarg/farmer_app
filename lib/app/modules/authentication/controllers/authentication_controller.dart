import 'package:farmer_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  void moveToEnterNameView() {
    Get.toNamed(Routes.ENTER_NAME);
  }

  void moveToOtpView() {
    Get.toNamed(Routes.OTP);
  }

  void moveToHomeView() {
    Get.toNamed(Routes.HOME);
  }
}
