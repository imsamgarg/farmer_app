import 'package:flutter/material.dart';

import 'package:get/utils.dart';

import 'package:farmer_app/app/core/theme/sizing_theme.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/core/values/strings.dart';

class Page extends StatelessWidget {
  final String heading;
  final String msg;
  final int imageIndex;

  const Page(
      {Key? key,
      required this.heading,
      required this.msg,
      required this.imageIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: ClipPath(
            clipper: PromoImageClipper(),
            child: Container(
              child: Image.asset(
                promoImages[imageIndex],
                fit: BoxFit.fitWidth,
                width: context.width,
              ),
            ),
          ),
        ),
        //Bottom Part
        Expanded(
          flex: 3,
          child: Padding(
            padding: Sizing.sidePadding,
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  headingStyle(heading),
                  const SizedBox(
                    height: 10,
                  ),
                  messageStyle(msg),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Page1 extends Page {
  Page1()
      : super(
          heading: "Farming Products Purchase",
          msg:
              "Yeoman App provides you the platform to buy quality seeds, Fertilisers and orgains",
          imageIndex: 0,
        );
}

class Page2 extends Page {
  Page2()
      : super(
          heading: "Field Information",
          msg: "Season based Farming, seed treatment according to season",
          imageIndex: 1,
        );
}

class Page3 extends Page {
  Page3()
      : super(
          heading: "Monitoring Technologies",
          msg:
              "Get Soil testing By yeomen App and Cultivate According to the qualities present in.",
          imageIndex: 2,
        );
}

class Page4 extends Page {
  Page4()
      : super(
          heading: "Weather Report",
          msg: "Farmer can easy farming through the pay day weather report",
          imageIndex: 3,
        );
}

class PromoImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var x = size.width;
    var y = size.height;
    path
      ..moveTo(0, 0)
      ..lineTo(0, y - 50)
      ..cubicTo(x / 2, y + 50, x - (x / 2), y - 100, x, y - 50)
      ..lineTo(x, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
