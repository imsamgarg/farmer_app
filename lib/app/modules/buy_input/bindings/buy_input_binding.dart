import 'package:get/get.dart';

import '../controllers/buy_input_controller.dart';

class BuyInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuyInputController>(
      () => BuyInputController(),
    );
  }
}
