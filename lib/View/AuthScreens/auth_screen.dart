import 'package:farmer_app/Utils/button.dart';
import 'package:farmer_app/Utils/constants.dart';
import 'package:farmer_app/Utils/widgets.dart';
import 'package:farmer_app/View/AuthScreens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AuthScreen extends StatelessWidget {
  final bool isNew;

  AuthScreen({Key? key, this.isNew = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isNew ? "Create An Acount" : "Welcome Back!!"),
      body: Padding(
        padding: sidePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  prefixText: "🇮🇳 +91", hintText: "Enter Mobile Number"),
            ),
            NextButton(() => Get.to(() => OtpScreen())),
          ],
        ),
      ),
    );
  }
}
