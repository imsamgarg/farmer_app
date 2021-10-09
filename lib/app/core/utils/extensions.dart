import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ColorExtension on BuildContext {
  get primaryColor => Theme.of(this).primaryColor;
}
