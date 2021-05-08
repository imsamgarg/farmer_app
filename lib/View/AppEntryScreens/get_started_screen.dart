import 'package:farmer_app/Utils/button.dart';
import 'package:farmer_app/Utils/colors.dart';
import 'package:farmer_app/Utils/constants.dart';
import 'package:farmer_app/Utils/utils.dart';
import 'package:farmer_app/View/AuthScreens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get/route_manager.dart';

///Promo Message Screen
class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _GetStartedScreen(),
    );
  }
}

class _GetStartedScreen extends StatefulWidget {
  @override
  __GetStartedScreenState createState() => __GetStartedScreenState();
}

class __GetStartedScreenState extends State<_GetStartedScreen> {
  var pageIndex = 0;
  late PageController? pageController = PageController(viewportFraction: 1);

  @override
  void dispose() {
    pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
              children: [_Page1(), _Page2(), _Page3(), _Page4()],
              controller: pageController,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NextButton(() {
                    if (pageIndex < 3)
                      pageController!.nextPage(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    else
                      Get.to(
                        () => AuthScreen(),
                      );
                  }),
                  SizedBox(
                    height: 60,
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _Dot(
                            isActive: pageIndex == 0 ? true : false,
                          ),
                          _Dot(
                            isActive: pageIndex == 1 ? true : false,
                          ),
                          _Dot(
                            isActive: pageIndex == 2 ? true : false,
                          ),
                          _Dot(
                            isActive: pageIndex == 3 ? true : false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Page extends StatelessWidget {
  final String heading;
  final String msg;
  final int imageIndex;

  const _Page(
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
            padding: sidePadding,
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

class PromoImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var x = size.width;
    var y = size.height;
    path
      ..moveTo(0, 0)
      ..lineTo(0, y - 50)
      ..cubicTo(x / 2, y + 50, x - (x / 2), y - 100, x, y-50)
      ..lineTo(x, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _Page1 extends _Page {
  _Page1()
      : super(
            heading: "Farming Products Purchase",
            msg:
                "Yeoman App provides you the platform to buy quality seeds, Fertilisers and orgains",
            imageIndex: 0);
}

class _Page2 extends _Page {
  _Page2()
      : super(
            heading: "Field Information",
            msg: "Season based Farming, seed treatment according to season",
            imageIndex: 1);
}

class _Page3 extends _Page {
  _Page3()
      : super(
            heading: "Monitoring Technologies",
            msg:
                "Get Soil testing By yeomen App and Cultivate According to the qualities present in.",
            imageIndex: 2);
}

class _Page4 extends _Page {
  _Page4()
      : super(
            heading: "Weather Report",
            msg: "Farmer can easy farming through the pay day weather report",
            imageIndex: 3);
}

class _Dot extends StatelessWidget {
  final bool isActive;

  const _Dot({Key? key, this.isActive = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isActive)
      return Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          height: 7,
          width: 30,
          decoration: BoxDecoration(
            color: accentColor,
            borderRadius: borderRadius,
          ),
        ),
      );
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 7,
        width: 7,
        decoration: BoxDecoration(
            color: accentColor.withAlpha(70), borderRadius: borderRadius),
      ),
    );
  }
}
