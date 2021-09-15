import 'package:get/get.dart';

import '../controllers/sell_produce_controller.dart';

class SellProduceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SellProduceController>(
      () => SellProduceController(),
    );
  }
}
