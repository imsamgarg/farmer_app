import 'package:farmer_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStartedControllerController extends GetxController {
  var pageIndex = 0;
  late PageController pageController = PageController(viewportFraction: 1);

  void onNextButton() {
    if (pageIndex < 3)
      pageController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    else
      Get.toNamed(Routes.WELCOME);
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
