import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:farmer_app/app/core/theme/sizing_theme.dart';

import 'color_theme.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    textTheme: GoogleFonts.interTextTheme(),
    scaffoldBackgroundColor: ColorTheme.whiteColor,
    backgroundColor: ColorTheme.whiteColor,
    primaryColor: ColorTheme.accentColor,
    brightness: Brightness.light,
    primaryColorLight: ColorTheme.accentColor,
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorTheme.accentColor,
        selectionColor: ColorTheme.accentColor,
        selectionHandleColor: ColorTheme.accentColor),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: GoogleFonts.inter(),
      filled: true,
      fillColor: Colors.transparent,
      focusedBorder: UnderlineInputBorder(
        borderRadius: Sizing.borderRadius,
        borderSide: BorderSide(color: ColorTheme.accentColor, width: 2),
      ),
      errorBorder: UnderlineInputBorder(
        borderRadius: Sizing.borderRadius,
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: Sizing.borderRadius,
        borderSide: BorderSide(color: ColorTheme.primaryColors[3], width: 2),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle:
            MaterialStateProperty.resolveWith((states) => GoogleFonts.inter()),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorTheme.whiteColor,
      foregroundColor: ColorTheme.accentColor,
      elevation: 0,
    ),
    tabBarTheme: TabBarTheme(
        labelColor: ColorTheme.accentColor,
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 16,
          // fontWeight: FontWeight.bold,
        ),
        unselectedLabelColor: ColorTheme.primaryColors[2],
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 2, color: ColorTheme.accentColor))),
  );
}
