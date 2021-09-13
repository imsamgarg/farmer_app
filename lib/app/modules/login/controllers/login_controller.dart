import 'package:get/get.dart';

import 'package:farmer_app/app/modules/login/views/otp_view.dart';
import 'package:farmer_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  void moveToOtp() {
    Get.to(OtpView());
  }

  void validate() async {
    Get.toNamed(Routes.HOME);
  }
}
