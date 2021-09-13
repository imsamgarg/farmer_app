import 'package:flutter/material.dart';

import 'package:get/state_manager.dart';

import 'package:farmer_app/app/core/global_widgets/button.dart';
import 'package:farmer_app/app/core/theme/color_theme.dart';
import 'package:farmer_app/app/core/theme/sizing_theme.dart';
import 'package:farmer_app/app/modules/launch_screen/controllers/launch_screen_controller.dart';
import 'package:farmer_app/app/modules/launch_screen/local_widgets/pages.dart';

///Promo Message Screen
class GetStartedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _GetStartedScreen(),
    );
  }
}

class _GetStartedScreen extends GetView<LaunchScreenController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: PageView(
              onPageChanged: controller.onPageChanged,
              children: [Page1(), Page2(), Page3(), Page4()],
              controller: controller.pageController,
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
                  NextButton(controller.onNextButton),
                  SizedBox(
                    height: 60,
                    child: Center(
                      child: Obx(
                        () => Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _Dot(
                              isActive:
                                  controller.pageIndex == 0 ? true : false,
                            ),
                            _Dot(
                              isActive:
                                  controller.pageIndex == 1 ? true : false,
                            ),
                            _Dot(
                              isActive:
                                  controller.pageIndex == 2 ? true : false,
                            ),
                            _Dot(
                              isActive:
                                  controller.pageIndex == 3 ? true : false,
                            ),
                          ],
                        ),
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
            color: ColorTheme.accentColor,
            borderRadius: Sizing.borderRadius,
          ),
        ),
      );
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 7,
        width: 7,
        decoration: BoxDecoration(
          color: ColorTheme.accentColor.withAlpha(70),
          borderRadius: Sizing.borderRadius,
        ),
      ),
    );
  }
}
