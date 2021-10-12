import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

extension ColorExtension on BuildContext {
  get primaryColor => Theme.of(this).primaryColor;
}

extension StringExtensions on String {
  // String limitText([int len=10]){
  //   return this.
  // }
  String get shortImageName {
    final ext = p.extension(this);
    final image = p.basenameWithoutExtension(this);
    if (image.length < 10) {
      return "$image$ext";
    }

    return "${image.substring(0, 10)}$ext";
  }
}
