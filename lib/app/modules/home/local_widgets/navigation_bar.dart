import 'package:flutter/material.dart';

import 'package:get/state_manager.dart';

import 'package:farmer_app/app/modules/home/controllers/home_controller.dart';

class CustomBottomNavBar extends GetView<HomeController> {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: controller.pageIndex,
      onTap: controller.onPageChange,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline_rounded),
          label: "Post",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_rounded),
          label: "Profile",
        ),
      ],
      selectedItemColor: Theme.of(context).colorScheme.primary,
    );
  }
}
