import 'package:farmer_app/app/data/services/auth_service.dart';
import 'package:get/get.dart';

import 'package:farmer_app/app/routes/app_pages.dart';

class StartupController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    checkIfUserLogged();
  }

  void checkIfUserLogged() async {
    final service = Get.find<AuthService>();
    if (await service.isSigned()) {
      return Get.offAllNamed(Routes.HOME);
    }
    return Get.offAllNamed(Routes.WELCOME);
  }
}
