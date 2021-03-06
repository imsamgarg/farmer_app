import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/values/strings.dart';
import 'package:farmer_app/app/modules/weather_report/controllers/weather_report_controller.dart';
import 'package:farmer_app/app/modules/weather_report/local_widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SingleDayReportView extends GetView<WeatherReportController> {
  final int day;

  SingleDayReportView(this.day);

  @override
  Widget build(BuildContext context) {
    final temp = day == 1 ? controller.nextDayTemp : controller.currentTemp;
    final feelsTemp =
        day == 1 ? controller.nextDayFeelTemp : controller.currentFeelTemp;
    final minTemp =
        day == 1 ? controller.nextDayMinTemp : controller.currentMinTemp;
    final maxTemp =
        day == 1 ? controller.nextDayMaxTemp : controller.currentMaxTemp;

    final humidity =
        day == 1 ? controller.nextDayHumidity : controller.currentHumidity;
    final windSpeed =
        day == 1 ? controller.nextDayWindSpeed : controller.currentWindSpeed;
    final windDirection = day == 1
        ? controller.nextDayWindDirection
        : controller.currentWindDirection;

    final sunrise =
        day == 1 ? controller.nextDaySunrise : controller.currentSunrise;
    final sunset =
        day == 1 ? controller.nextDaySunset : controller.currentSunset;
    return Column(
      children: [
        verSpacing20,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WeatherHeading(temp: temp),
              WeatherImage(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  horSpacing4,
                  "Sunny day".text.bold.make(),
                  horSpacing10,
                  "$maxTemp$degreeSymbol/$minTemp$degreeSymbol".text.make(),
                ],
              ),
              "Feels Like $feelsTemp$degreeSymbol".text.semiBold.sm.make(),
            ],
          ),
        ),
        verSpacing28,
        ListDivider(),
        DaysWeatherinfoTile(
          leading: "Sunrise,Sunset",
          trailing: "$sunrise, $sunset",
        ),
        DaysWeatherinfoTile(
          leading: "Wind",
          trailing: "$windSpeed Km/hr, $windDirection",
        ),
        DaysWeatherinfoTile(
          leading: "Humidity",
          trailing: "$humidity%",
        ),
        DaysWeatherinfoTile(
          leading: "Chance Of Rain",
          trailing: "10%",
        ),
        // Container(
        //   color: Vx.gray100,
        //   height: 150,
        //   padding: const EdgeInsets.all(10),
        //   child: ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemCount: 10,
        //     itemBuilder: (c, i) {
        //       return WeatherInfoBox(
        //         time: "4:00 PM",
        //         temp: 16,
        //         isActive: i == 0,
        //         type: "Sunny Day",
        //       );
        //     },
        //   ),
        // ),
      ],
    ).scrollVertical();
  }
}
