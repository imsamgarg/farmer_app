// import 'package:farmer_app/Utils/colors.dart';
// import 'package:farmer_app/Utils/constants.dart';
// import 'package:farmer_app/Utils/widgets.dart';
import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/theme/color_theme.dart';
import 'package:farmer_app/app/core/values/strings.dart';
import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_view.dart';

class NotificationsView extends StatelessWidget {
  final String appBarText = "Notification";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarText),
      body: Container(
        child: ListView(
          children: [
            _Date(),
            _CustomTile(
              message:
                  "Agriculture means cultivating soil and producing crops & the science",
              time: "1m",
            ),
            _CustomTile(
              message:
                  "Agriculture means cultivating soil and producing crops & the science",
              time: "1m",
            ),
            _CustomTile(
              message:
                  "Agriculture means cultivating soil and producing crops & the science",
              time: "1m",
            ),
            _CustomTile(
              message:
                  "Agriculture means cultivating soil and producing crops & the science",
              time: "1m",
            ),
            _CustomTile(
              message:
                  "Agriculture means cultivating soil and producing crops & the science",
              time: "1m",
            ),
            _CustomTile(
              message:
                  "Agriculture means cultivating soil and producing crops & the science",
              time: "1m",
            ),
            _CustomTile(
              message:
                  "Agriculture means cultivating soil and producing crops & the science",
              time: "1m",
            ),
            _CustomTile(
              message:
                  "Agriculture means cultivating soil and producing crops & the science",
              time: "1m",
            ),
            _CustomTile(
              message:
                  "Agriculture means cultivating soil and producing crops & the science",
              time: "1m",
            ),
            _CustomTile(
              message:
                  "Agriculture means cultivating soil and producing crops & the science",
              time: "1m",
            ),
            _Date(
              date: "Yesterday",
            ),
            _CustomTile(
              message:
                  "Agriculture means cultivating soil and producing crops & the science",
              time: "1m",
            ),
            _CustomTile(
              message:
                  "Agriculture means cultivating soil and producing crops & the science",
              time: "1m",
            ),
            _CustomTile(
              message:
                  "Agriculture means cultivating soil and producing crops & the science",
              time: "1m",
            ),
            _CustomTile(
              message:
                  "Agriculture means cultivating soil and producing crops & the science",
              time: "1m",
            ),
            _CustomTile(
              message:
                  "Agriculture means cultivating soil and producing crops & the science",
              time: "1m",
            ),
            _CustomTile(
              message:
                  "Agriculture means cultivating soil and producing crops & the science",
              time: "1m",
            ),
            _CustomTile(
              message:
                  "Agriculture means cultivating soil and producing crops & the science",
              time: "1m",
            ),
            _CustomTile(
              message:
                  "Agriculture means cultivating soil and producing crops & the science",
              time: "1m",
            ),
            _CustomTile(
              message:
                  "Agriculture means cultivating soil and producing crops & the science",
              time: "1m",
            ),
            _CustomTile(
              message:
                  "Agriculture means cultivating soil and producing crops & the science",
              time: "1m",
            ),
          ],
        ),
      ),
    );
  }
}

class _Date extends StatelessWidget {
  final String? date;

  const _Date({Key? key, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          horSpacing15,
          (date ?? "Today")
              .text
              .center
              .semiBold
              .color(ColorTheme.primaryColors[3])
              .make(),
        ],
      ),
    );
  }
}

class _CustomTile extends StatelessWidget {
  final String? leadingImage;
  final String message;
  final String? time;

  const _CustomTile(
      {Key? key, this.leadingImage, required this.message, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => HomeView());
      },
      child: Container(
        height: 70,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            horSpacing15,
            SizedBox(
              width: 50,
              child: Image.asset(
                leadingImage ?? logo,
              ),
            ),
            horSpacing15,
            Expanded(
              child: Container(
                child: message.text.make(),
              ),
            ),
            horSpacing15,
            SizedBox(
              width: 30,
              child: ((time ?? "1h")
                  .text
                  .color(ColorTheme.primaryColors[3])
                  .make()),
            ),
            horSpacing15,
          ],
        ),
      ),
    );
  }
}
