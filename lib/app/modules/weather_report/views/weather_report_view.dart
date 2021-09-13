import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:farmer_app/app/core/global_widgets/app_bar.dart';

import '../controllers/weather_report_controller.dart';

class WeatherReportView extends GetView<WeatherReportController> {
  final title = "Weather Report";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title),
      body: Center(
        child: Text(
          'WeatherReportView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
