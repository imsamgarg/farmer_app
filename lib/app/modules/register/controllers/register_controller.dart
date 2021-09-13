import 'package:get/get.dart';

import 'package:farmer_app/app/modules/register/views/register_otp_view.dart';
import 'package:farmer_app/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  void moveToOtpView() async {
    Get.to(RegisterOtpView());
  }

  void validate() async {
    Get.toNamed(Routes.HOME);
  }
}
