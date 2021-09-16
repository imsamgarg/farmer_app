import 'package:custom_utils/spacing_utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:farmer_app/app/core/theme/color_theme.dart';
import 'package:farmer_app/app/core/values/values.dart';

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

produceInpuDecoration(String text) {
  return InputDecoration(
    // labelText: text,
    // isDense: true,
    // label: Column(
    //   children: [
    //     text.text.make(),
    //     // verSpacing10,
    //   ],
    // ),
    contentPadding: EdgeInsets.zero,
    alignLabelWithHint: false,
    floatingLabelBehavior: FloatingLabelBehavior.always,
  );
}

void goBack() {
  Get.back();
}
