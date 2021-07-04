import 'package:farmer_app/Utils/button.dart';
import 'package:farmer_app/Utils/colors.dart';
import 'package:farmer_app/Utils/constants.dart';
import 'package:farmer_app/Utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        "Edit Profile",
        actions: [
          TextButton(
            onPressed: () {},
            child: "Edit".text.semiBold.black.make(),
          )
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    child: Image.asset(
                      logo,
                    ),
                  ),
                ),
                verSpacing5,
                CustomButton(
                  child: ("Change Profile Picture").text.underline.make(),
                  onPressed: () {},
                  bgColor: whiteColor,
                  overlayColor: primaryColors[3],
                  fgColor: Color(0xffEB4225),
                )
              ],
            ),
            "Name".text.make(),
            TextFormField(
              controller: TextEditingController(text: "Smile Garg"),
              validator: (v) => emptyValidator(v, "Name"),
            ),
            verSpacing20,
            "Phone Number".text.make(),
            TextFormField(
              controller: TextEditingController(text: "9876543210"),
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
            verSpacing20,
            "Address".text.make(),
            TextFormField(
              controller: TextEditingController(text: "Earth"),
              validator: (v) => emptyValidator(v, "Address"),
            ),
            verSpacing15,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ("Land Details").text.bold.color(primaryColors[2]).make(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: primaryColors[2],
                        size: 20,
                      )
                    ],
                  ),
                  onPressed: () {},
                  bgColor: whiteColor,
                  overlayColor: primaryColors[4],
                ),
                CustomButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ("Your Crops").text.bold.color(primaryColors[2]).make(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: primaryColors[2],
                        size: 20,
                      )
                    ],
                  ),
                  onPressed: () {},
                  bgColor: whiteColor,
                  overlayColor: primaryColors[4],
                ),
                CustomButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ("About").text.bold.color(primaryColors[2]).make(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: primaryColors[2],
                        size: 20,
                      )
                    ],
                  ),
                  onPressed: () {},
                  bgColor: whiteColor,
                  overlayColor: primaryColors[4],
                ),
                CustomButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ("logout").text.bold.color(primaryColors[2]).make(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: primaryColors[2],
                        size: 20,
                      )
                    ],
                  ),
                  onPressed: () {},
                  bgColor: whiteColor,
                  overlayColor: primaryColors[4],
                ),
              ],
            ),
          ],
        ),
      ).px20().scrollVertical(),
    );
  }

  emptyValidator(String? v, [String? s]) {
    if (v == "")
      return "Please Enter ${s ?? "Value"}";
    else
      return;
  }
}
