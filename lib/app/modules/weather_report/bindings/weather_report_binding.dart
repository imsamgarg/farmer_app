import 'package:get/get.dart';

import '../controllers/weather_report_controller.dart';

class WeatherReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherReportController>(
      () => WeatherReportController(),
    );
  }
}
