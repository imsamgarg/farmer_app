import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

extension ColorExtension on BuildContext {
  get primaryColor => Theme.of(this).primaryColor;
}

extension StringExtensions on String {
  String get shortImageName {
    final ext = p.extension(this);
    final image = p.basenameWithoutExtension(this);
    if (image.length < 10) {
      return "$image$ext";
    }

    return "${image.substring(0, 10)}$ext";
  }
}

extension DateExtensions on DateTime {
  String weatherTime(context) {
    return TimeOfDay.fromDateTime(this).format(context);
  }

  String getDayName() {
    switch (this.weekday) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
      default:
        return "";
    }
  }
}

extension DurationExtensions on Duration {
  String timeDifference() {
    if (this.inMinutes == 0) return "Now";
    if (this.inMinutes.abs() <= 60) return "${this.inMinutes.abs()}m";
    if (this.inHours.abs() <= 24) return "${this.inHours.abs()}h";
    return "${this.inDays.abs()}d";
  }
}
