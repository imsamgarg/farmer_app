import 'package:farmer_app/app/modules/weather_report/local_widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MultiDayReportView extends GetView {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (c, i) {
        return WeatherInfoTile(
          day: "Sunday",
          humidity: 89,
          minTemp: 20,
          maxTemp: 29,
        );
      },
    );
  }
}
