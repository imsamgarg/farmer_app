import 'package:farmer_app/app/core/values/values.dart';
import 'package:flutter/material.dart';

class Sizing {
  static const borderRadius = BorderRadius.all(Radius.circular(5));

  ///Ver:-8 Hor:-20
  static const sidePadding = EdgeInsets.symmetric(vertical: 8, horizontal: 20);

  ///left:20
  static const leftPadding = EdgeInsets.only(left: 20);

  static final cardShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
}
