import 'package:get/get.dart';

import 'package:farmer_app/app/modules/home/views/edit_profile_view.dart';

class ProfileController extends GetxController {
  void editProfile() {
    Get.to(EditProfileView());
  }
}
