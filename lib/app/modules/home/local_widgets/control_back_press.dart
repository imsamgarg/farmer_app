import 'package:farmer_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ControlBackPress extends GetView<HomeController> {
  const ControlBackPress({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: child,
      onWillPop: controller.controlBackPress,
    );
  }
}
