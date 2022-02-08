import 'package:custom_utils/log_utils.dart';
import 'package:farmer_app/app/modules/weather_report/controllers/weather_report_controller.dart';
import 'package:farmer_app/app/modules/weather_report/local_widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../core/utils/extensions.dart';

class MultiDayReportView extends GetView<WeatherReportController> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.fiveDaysWeather.length,
      itemBuilder: (c, i) {
        return WeatherInfoTile(
          day: controller.fiveDaysWeather[i].date!.getDayName(),
          humidity: controller.fiveDaysWeather[i].humidity! ~/ 1,
          minTemp: controller.fiveDaysWeather[i].tempMin!.celsius! ~/ 1,
          maxTemp: controller.fiveDaysWeather[i].tempMax!.celsius! ~/ 1,
          weather: controller.fiveDaysWeather[i].weatherDescription!,
        );
      },
    );
  }
}
