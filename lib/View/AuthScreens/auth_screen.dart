import 'package:farmer_app/Utils/button.dart';
import 'package:farmer_app/Utils/constants.dart';
import 'package:farmer_app/Utils/widgets.dart';
import 'package:farmer_app/View/AuthScreens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                prefixIcon: Padding(
                    padding: EdgeInsets.all(12),
                    child: "🇮🇳 +91 ".text.size(16).make()),
                prefixStyle: TextStyle(color: Colors.black, fontSize: 16),
                hintText: "Enter Mobile Number",
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NextButton(() => Get.to(() => OtpScreen())),
                verSpacing5,
              ],
            )
          ],
        ),
      ),
    );
  }
}
