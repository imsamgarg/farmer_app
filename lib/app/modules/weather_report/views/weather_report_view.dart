import 'package:custom_utils/future.dart';
import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:farmer_app/app/modules/weather_report/views/multi_day_report_view.dart';
import 'package:farmer_app/app/modules/weather_report/views/single_day_report_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/weather_report_controller.dart';

class WeatherReportView extends GetView<WeatherReportController> {
  final title = "Weather Report";
  final tab_1 = "Today";
  final tab_2 = "Tommorrow";
  final tab_3 = "5 Days";

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
      future: controller.instance,
      loading: Container(color: Vx.white, child: CenterLoading()),
      errorBuilder: (e) {
        return Scaffold(
          body: Center(
            child: Text("Error$e"),
          ),
        );
      },
      builder: (_) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: CustomAppBar(
              title,
              bottom: TabBar(tabs: [
                Tab(text: tab_1),
                Tab(text: tab_2),
                Tab(text: tab_3),
              ]),
            ),
            body: TabBarView(
              children: [
                SingleDayReportView(0),
                SingleDayReportView(1),
                MultiDayReportView(),
              ],
            ),
          ),
        );
      },
    );
  }
}
