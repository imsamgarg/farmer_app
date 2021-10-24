import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/app/core/theme/sizing_theme.dart';
import 'package:farmer_app/app/data/services/auth_service.dart';
import 'package:farmer_app/app/data/services/db_service.dart';
import 'package:farmer_app/app/data/services/native_service.dart';
import 'package:farmer_app/app/data/services/storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:get/get.dart';
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

FirebaseAuth getAuth() {
  return getAuthService().auth;
}

AuthService getAuthService() {
  return Get.find<AuthService>();
}

FirebaseFirestore getDb() {
  return getDbService().instance;
}

DatabaseService getDbService() {
  return Get.find<DatabaseService>();
}

NativeService getNativeService() {
  return Get.find<NativeService>();
}

CloudStorageService getStorageService() {
  return Get.find<CloudStorageService>();
}

void successSnackbar(
  String message, [
  int sec = 4,
  SnackPosition snackPosition = SnackPosition.BOTTOM,
]) {
  return customSnackBar(
    message,
    Icon(Icons.check, color: Vx.white),
    ColorTheme.successColor,
    snackPosition: snackPosition,
  );
}

void errorSnackbar(
  String message, [
  int sec = 4,
  SnackPosition snackPosition = SnackPosition.BOTTOM,
]) {
  return customSnackBar(
    message,
    Icon(Icons.cancel_rounded, color: Vx.white),
    ColorTheme.errorColor,
    snackPosition: snackPosition,
  );
}

void customSnackBar(
  String message,
  Icon icon,
  Color bgColor, {
  int sec = 4,
  Color fgColor = Vx.white,
  SnackPosition snackPosition = SnackPosition.BOTTOM,
}) {
  Get.rawSnackbar(
    message: message,
    snackPosition: snackPosition,
    shouldIconPulse: false,
    icon: icon,
    duration: Duration(seconds: sec),
    backgroundColor: bgColor,
    overlayColor: fgColor,
    borderRadius: Sizing.radiusS,
  );
}

// Future<T> showOverlay<T>(Future<T> fun()) async {
//   final value = await Get.showOverlay(
//     asyncFunction: fun,
//     loadingWidget: SpinKitThreeBounce(color: ColorTheme.primaryColor),
//   );
//   return value;
// }

Color primaryColor(BuildContext context) {
  return Theme.of(context).primaryColor;
}
