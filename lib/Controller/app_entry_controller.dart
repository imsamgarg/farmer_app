import 'package:farmer_app/Controller/Authentication/auth_controller.dart';
import 'package:farmer_app/View/AppEntryScreens/welcome_screen.dart';
import 'package:farmer_app/View/MainScreens/home_screen.dart';
import 'package:get/get.dart';

class AppEntryController extends GetxController {
  late AuthController _authController = Get.put(AuthController());

  @override
  void onReady() {
    super.onReady();
    getToken();
  }

  void getToken() async {
    // if (_authController.isUserLogged())
    if (false)
      Get.off(() => HomeScreen());
    else
      Get.off(() => WelcomeScreen());
  }
}
