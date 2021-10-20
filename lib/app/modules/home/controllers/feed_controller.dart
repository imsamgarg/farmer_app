import 'package:get/get.dart';

import 'home_controller.dart';

class FeedController extends GetxController {
  late final categories = Get.find<HomeController>().categories;

  void openFilters() {}
}
