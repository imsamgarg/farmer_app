import 'package:farmer_app/Utils/button.dart';
import 'package:farmer_app/Utils/colors.dart';
import 'package:farmer_app/Utils/constants.dart';
import 'package:farmer_app/Utils/utils.dart';
import 'package:farmer_app/Utils/widgets.dart';
import 'package:farmer_app/View/ProfileScreens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';

class CreatePostScreen extends StatelessWidget {
  styleChip(String text) => text.text
      .color(primaryColors[2])
      .size(15)
      .make()
      .box
      .p8
      .border(color: primaryColors[3])
      .make();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        screen: postScreen,
      ),
      appBar: CustomAppBar(
        "Create Post",
        actions: [
          CustomButton(
              child: "Post".text.semiBold.color(primaryColors[2]).make(),
              bgColor: Colors.transparent,
              overlayColor: primaryColors[3],
              onPressed: () {}),
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Get.to(() => ProfileScreen()),
              child: Container(
                height: 50,
                child: Row(
                  children: [
                    Image.asset(logoSm),
                    horSpacing10,
                    "Smile Garg"
                        .text
                        .semiBold
                        .size(16)
                        .color(primaryColors[1])
                        .make(),
                  ],
                ).p8(),
              ),
            ),
            verSpacing10,
            TextField(
              minLines: 6,
              autofocus: false,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: "What's on your mind?",
                border: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide.none,
                ),
                fillColor: primaryColors[4],
                filled: true,
                suffixIcon: Icon(
                  Icons.settings_voice_outlined,
                ),
              ),
            ),
            verSpacing20,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Add Image".text.semiBold.color(primaryColors[2]).make(),
                verSpacing10,
                CustomButton(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.cloud_upload_outlined,
                        size: 16,
                        color: primaryColors[2],
                      ),
                      horSpacing10,
                      "Upload Image".text.color(primaryColors[2]).make(),
                    ],
                  ),
                  overlayColor: primaryColors[3],
                  onPressed: () {},
                  bgColor: primaryColors[4],
                )
              ],
            ),
            verSpacing20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Select Categories"
                    .text
                    .semiBold
                    .color(primaryColors[2])
                    .make(),
                verSpacing10,
                Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    styleChip("Soil testing"),
                    styleChip("Soil testing"),
                    styleChip("Soil testing"),
                    styleChip("Soil testing"),
                    styleChip("Soil testing"),
                    styleChip("Soil testing"),
                    styleChip("Soil testing"),
                    styleChip("Soil testing"),
                    styleChip("Soil testing"),
                    styleChip("Soil testing"),
                    styleChip("Soil testing"),
                    styleChip("Soil testing"),
                    styleChip("Soil testing"),
                    styleChip("Soil testing"),
                    styleChip("Soil testing"),
                    styleChip("Soil testing"),
                    styleChip("Soil testing"),
                    styleChip("Soil testing"),
                    styleChip("Soil testing"),
                    styleChip("Soil testing"),
                    styleChip("Soil testing"),
                    styleChip("Soil testing"),
                  ],
                ),
              ],
            ),
          ],
        ).px16(),
      ).scrollVertical(),
    );
  }
}
