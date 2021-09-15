import 'package:farmer_app/app/modules/sell_produce/views/requests_view.dart';
import 'package:get/get.dart';

class SellProduceController extends GetxController {
  void onSubmit() {
    Get.to(() => RequestsView());
  }
}
