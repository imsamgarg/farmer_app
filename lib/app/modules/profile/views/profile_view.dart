import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/theme/color_theme.dart';
import 'package:farmer_app/app/core/values/strings.dart';
import 'package:farmer_app/app/core/values/values.dart';
import 'package:farmer_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/state_manager.dart';
import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        screen: profileScreen,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: AppHeading(),
              ),
              Column(
                children: [
                  _Avatar(),
                  verSpacing15,
                  Column(
                    children: [
                      _Tile(
                        message: "Weather Report",
                      ),
                      _Tile(
                        message: "Disease Detection",
                      ),
                      _Tile(
                        message: "Crop Manuals",
                      ),
                      _Tile(
                        message: "Buy Input",
                      ),
                      _Tile(
                        message: "Sell Produce",
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ).scrollVertical(),
      ),
    );
  }
}

class _Tile extends GetView<ProfileController> {
  final String message;

  const _Tile({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(weatherReport),
                horSpacing20,
                message.text
                    .size(18)
                    .semiBold
                    .color(Theme.of(context).colorScheme.primary)
                    .make(),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
                horSpacing15
              ],
            ),
          ],
        ).px16().py12(),
      ),
    );
  }
}

class _Avatar extends GetView<ProfileController> {
  const _Avatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: controller.editProfile,
      child: Container(
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(logo),
            horSpacing15,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Smile Garg"
                    .text
                    .size(18)
                    .semiBold
                    .color(ColorTheme.primaryColors[1])
                    .make(),
                "+91 9876543210"
                    .text
                    .size(12)
                    .color(ColorTheme.primaryColors[2])
                    .make(),
              ],
            )
          ],
        ).p16(),
      ),
    );
  }
}
