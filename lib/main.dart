import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Utils/constants.dart';
import 'Utils/theme.dart';
import 'View/AppEntryScreens/app_entry_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      theme: lightTheme,
      themeMode: ThemeMode.light,

      ///App Entry Screen
      ///Show Loading screen At First Start
      home: AppEntryScreen(),
      defaultTransition: Transition.rightToLeft,
    );
  }
}
