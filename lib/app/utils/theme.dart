import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './colors.dart';
import './constants.dart';

final lightTheme = ThemeData(
  textTheme: GoogleFonts.interTextTheme(),
  scaffoldBackgroundColor: whiteColor,
  backgroundColor: whiteColor,
  primaryColor: accentColor,
  brightness: Brightness.light,
  accentColor: accentColor,
  textSelectionTheme: TextSelectionThemeData(
      cursorColor: accentColor,
      selectionColor: accentColor,
      selectionHandleColor: accentColor),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: GoogleFonts.inter(),
    filled: true,
    fillColor: Colors.transparent,
    focusedBorder: UnderlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: accentColor, width: 2),
    ),
    errorBorder: UnderlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
    enabledBorder: UnderlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: primaryColors[3], width: 2),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle:
          MaterialStateProperty.resolveWith((states) => GoogleFonts.inter()),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: whiteColor,
    foregroundColor: accentColor,
    elevation: 0,
  ),
  tabBarTheme: TabBarTheme(
      labelColor: accentColor,
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 16,
        // fontWeight: FontWeight.bold,
      ),
      unselectedLabelColor: primaryColors[2],
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 2, color: accentColor))),
);
