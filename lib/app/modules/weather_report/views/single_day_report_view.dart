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
    final temp = controller.currentTemp;
    final feelsTemp = controller.currentFeelTemp;
    final minTemp = controller.currentMinTemp;
    final maxTemp = controller.currentMaxTemp;

    final humidity = controller.currentHumidity;
    final windSpeed = controller.currentWindSpeed;
    final windDirection = controller.currentWindDirection;

    final sunrise = controller.currentSunrise;
    final sunset = controller.currentSunset;
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
        Container(
          color: Vx.gray100,
          height: 150,
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (c, i) {
              return WeatherInfoBox(
                time: "4:00 PM",
                temp: 16,
                isActive: i == 0,
                type: "Sunny Day",
              );
            },
          ),
        ),
      ],
    ).scrollVertical();
  }
}
