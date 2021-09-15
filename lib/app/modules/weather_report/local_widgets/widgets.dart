import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/values/strings.dart';
import 'package:farmer_app/assets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class WeatherInfoTile extends StatelessWidget {
  const WeatherInfoTile({
    Key? key,
    required this.day,
    required this.humidity,
    required this.minTemp,
    required this.maxTemp,
  }) : super(key: key);
  final String day;
  final int humidity;
  final int minTemp;
  final int maxTemp;
  @override
  Widget build(BuildContext context) {
    final temp = "$minTemp$degreeSymbol/$maxTemp$degreeSymbol";
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                day.text.size(15).semiBold.make(),
                _WeatherInfo(humidity: humidity),
                temp.text.make(),
              ],
            ),
          ),
        ),
        ListDivider(),
      ],
    );
  }
}

class DaysWeatherinfoTile extends StatelessWidget {
  const DaysWeatherinfoTile({
    Key? key,
    required this.leading,
    required this.trailing,
  }) : super(key: key);
  final String leading;
  final String trailing;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 55,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                leading.text.size(15).make(),
                trailing.text.semiBold.make(),
              ],
            ),
          ),
        ),
        ListDivider(),
      ],
    );
  }
}

class ListDivider extends StatelessWidget {
  const ListDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Divider(
        thickness: 1,
      ),
    );
  }
}

class _WeatherInfo extends StatelessWidget {
  const _WeatherInfo({Key? key, required this.humidity}) : super(key: key);
  final int humidity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        WeatherImage().py8(),
        horSpacing10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            "$humidity%".text.bold.size(16).make(),
            "Sunny".text.sm.make(),
          ],
        ),
      ],
    );
  }
}

class WeatherImage extends StatelessWidget {
  const WeatherImage({Key? key, this.type}) : super(key: key);
  final String? type;
  @override
  Widget build(BuildContext context) {
    return Image.asset(type ?? Assets.to.sunImagePNG);
  }
}

class WeatherHeading extends StatelessWidget {
  const WeatherHeading({
    Key? key,
    required this.temp,
  }) : super(key: key);
  final int temp;
  @override
  Widget build(BuildContext context) {
    final temperature = "$temp$degreeSymbol";
    return Container(
      child: temperature.text.lg.size(75).bold.make(),
    );
  }
}

class WeatherInfoBox extends StatelessWidget {
  const WeatherInfoBox({
    Key? key,
    this.isActive = false,
    required this.time,
    required this.temp,
    required this.type,
  }) : super(key: key);
  final bool isActive;
  final String time;
  final int temp;
  final String type;
  @override
  Widget build(BuildContext context) {
    final temperature = "$temp$degreeSymbol";
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            time.text.semiBold.make(),
            SizedBox(
              height: 45,
              child: WeatherImage(
                type: isActive ? Assets.to.sunImagePNG : Assets.to.fadeSunPNG,
              ),
            ),
            temperature.text.make(),
            type.text.sm.make(),
          ],
        ),
      ).box.roundedSM.color(isActive ? Vx.white : Colors.transparent).make(),
    );
  }
}
