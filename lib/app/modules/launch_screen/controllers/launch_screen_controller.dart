import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:farmer_app/app/modules/launch_screen/views/get_started_view.dart';
import 'package:farmer_app/app/routes/app_pages.dart';

class LaunchScreenController extends GetxController {
  void iHaveAnAccount() {
    Get.toNamed(Routes.LOGIN);
  }

  void getStartedButton() {
    Get.to(GetStartedView());
  }

  final _pageIndex = 0.obs;
  get pageIndex => this._pageIndex.value;
  set pageIndex(value) => this._pageIndex.value = value;

  late PageController pageController = PageController(viewportFraction: 1);

  void onNextButton() {
    if (pageIndex < 3) {
      pageController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    } else {
      Get.toNamed(Routes.REGISTER);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int value) {
    pageIndex = value;
  }
}
