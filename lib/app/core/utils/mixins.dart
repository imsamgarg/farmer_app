import 'package:custom_utils/log_utils.dart';
import 'package:get/utils.dart';

mixin Validators {
  String? phoneNumberValidator(String? value, [int minLen = 10]) {
    value ??= "";
    value.removeAllWhitespace;

    if (value.isEmpty) return "Please Enter Phone Number";
    if (!value.isPhoneNumber) return "Enter Valid Number";
    if (value.length < 10) return "Enter Valid Number";
    return null;
  }

  String? otpCodeValidator(String? value, [int minLen = 6]) {
    value ??= "";
    value.removeAllWhitespace;

    if (value.isEmpty) return "Please Enter Otp";
    if (!value.isNumericOnly) return "Only Digits Are Allowed";
    if (value.length != minLen) return "Enter 6 Digits ";
    return null;
  }

  String? nameValidotor(String? value, [bool numbersAllowed = false]) {
    value ??= "";
    value = value.removeAllWhitespace;
    if (value.isEmpty) return "Please Enter Name";
    customLog(value);
    if (!value.isAlphabetOnly && !numbersAllowed) {
      return "Only Alphabets Are Allowed";
    }
    return null;
  }
}
