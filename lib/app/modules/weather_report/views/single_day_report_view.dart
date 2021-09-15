import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/values/strings.dart';
import 'package:farmer_app/app/modules/weather_report/local_widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SingleDayReportView extends GetView {
  final int day;

  SingleDayReportView(this.day);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verSpacing20,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WeatherHeading(temp: 11),
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
                  "30$degreeSymbol/10$degreeSymbol".text.make(),
                ],
              ),
              "Feels Like 18$degreeSymbol".text.semiBold.sm.make(),
            ],
          ),
        ),
        verSpacing28,
        ListDivider(),
        DaysWeatherinfoTile(
          leading: "Sunrise,Sunset",
          trailing: "07:31 AM, 05:59 PM",
        ),
        DaysWeatherinfoTile(
          leading: "Wind",
          trailing: "1 Km/hr, SW",
        ),
        DaysWeatherinfoTile(
          leading: "Humidity",
          trailing: "52%",
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
