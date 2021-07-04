import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'colors.dart';
import 'constants.dart';

///Heading Text !!
headingStyle(String text) =>
    text.text.lg.center.bold.size(fontSizeXL).color(accentColor).make();

///Message Text !!!
messageStyle(String text) => text.text.center.color(primaryColors[2]).make();

///Add Hint
inputDecor({required String hint}) {
  return InputDecoration(hintText: hint);
}

enum NavigateScreen {
  Home,
  Post,
  Profile,
}

const homeScreen = NavigateScreen.Home;
const postScreen = NavigateScreen.Post;
const profileScreen = NavigateScreen.Profile;
