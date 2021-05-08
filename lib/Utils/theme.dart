import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './colors.dart';
import './constants.dart';

final lightTheme = ThemeData(
  textTheme: GoogleFonts.interTextTheme(),
  scaffoldBackgroundColor: whiteColor,
  backgroundColor: whiteColor,
  primaryColor: accentColor,
  accentColor: accentColor,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: GoogleFonts.inter(),
    filled: true,
    fillColor: primaryColors[4],
    border: OutlineInputBorder(
        borderRadius: borderRadius, borderSide: BorderSide.none),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle:
          MaterialStateProperty.resolveWith((states) => GoogleFonts.inter()),
    ),
  ),
  appBarTheme: AppBarTheme(
      backgroundColor: whiteColor, foregroundColor: accentColor, elevation: 0),
);
