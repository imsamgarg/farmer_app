import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/weather_report_controller.dart';

class WeatherReportView extends GetView<WeatherReportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WeatherReportView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'WeatherReportView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
