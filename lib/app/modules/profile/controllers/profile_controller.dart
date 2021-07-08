import 'package:farmer_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  void editProfile() {
    Get.toNamed(Routes.EDIT_PROFILE);
  }
}
