import 'package:farmer_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class StartupController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    if (await getUser()) {}
    return Get.toNamed(Routes.WELCOME);
  }

  Future getUser() async {
    await 1.delay();
    return false;
  }
}
