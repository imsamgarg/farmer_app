import 'package:custom_utils/future.dart';
import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:farmer_app/app/modules/home/controllers/profile_route_controller.dart';
import 'package:farmer_app/app/modules/home/local_widgets/control_back_press.dart';
import 'package:farmer_app/app/modules/home/local_widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:custom_utils/spacing_utils.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:farmer_app/app/core/theme/color_theme.dart';
import 'package:farmer_app/app/core/values/strings.dart';
import 'package:farmer_app/app/modules/home/controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final profileRoutes = Get.find<ProfileRoutesController>();

  @override
  Widget build(BuildContext context) {
    return ControlBackPress(
      child: Scaffold(
        body: CustomFutureBuilder(
          future: controller.instance,
          builder: (snapshot) {
            return SafeArea(
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
                              onTap: profileRoutes.openWeatherReport,
                            ),
                            _Tile(
                              message: "Disease Detection",
                              onTap: profileRoutes.openDiseaseDetection,
                            ),
                            _Tile(
                              message: "Sell Produce",
                              onTap: profileRoutes.openSellProduce,
                            ),
                            _Tile(
                              message: "Crop Manuals",
                              onTap: profileRoutes.openCropManual,
                            ),
                            _Tile(
                              message: "Buy Input",
                              onTap: profileRoutes.openBuyInput,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ).scrollVertical(),
            );
          },
          loading: CenterLoading(),
          errorBuilder: (_) {
            return Text('Error');
          },
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final String message;
  final VoidCallback? onTap;
  const _Tile({Key? key, required this.message, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      child: InkWell(
        onTap: this.onTap,
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
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: controller.gotoToEditProfile,
      child: Container(
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 50,
              height: 50,
              child: RoundedDp(
                url: controller.profileImage,
                name: controller.name,
              ),
            ),
            horSpacing15,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // controller.name.text
                //     .size(18)
                //     .semiBold
                //     .color(ColorTheme.primaryColors[1])
                //     .make(),

                DisplayName(),
                controller.number.text
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
