import 'package:farmer_app/Utils/button.dart';
import 'package:farmer_app/Utils/constants.dart';
import 'package:farmer_app/Utils/widgets.dart';
import 'package:farmer_app/View/AuthScreens/enter_name_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';

class OtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Enter Your Code"),
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
            Column(
              children: [
                "I didn't get a code".text.orange400.underline.make(),
                verSpacing10,
                NextButton(() => Get.to(() => EnterNameScreen())),
                verSpacing5
              ],
            ),
          ],
        ),
      ),
    );
  }
}
