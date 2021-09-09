import 'package:farmer_app/app/core/theme/color_theme.dart';
import 'package:farmer_app/app/core/values/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

///Heading Text !!
headingStyle(String text) => text.text.lg.center.bold
    .size(fontSizeXL)
    .color(ColorTheme.accentColor)
    .make();

///Message Text !!!
messageStyle(String text) =>
    text.text.center.color(ColorTheme.primaryColors[2]).make();

///Add Hint
inputDecor({required String hint}) {
  return InputDecoration(hintText: hint);
}

void goBack() {
  Get.back();
}
