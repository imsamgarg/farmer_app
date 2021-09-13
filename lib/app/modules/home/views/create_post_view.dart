import 'package:flutter/material.dart';

import 'package:custom_utils/spacing_utils.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/global_widgets/button.dart';
import 'package:farmer_app/app/core/theme/color_theme.dart';
import 'package:farmer_app/app/core/theme/sizing_theme.dart';
import 'package:farmer_app/app/core/values/strings.dart';

class CreatePostView extends StatelessWidget {
  styleChip(String text) => text.text
      .color(ColorTheme.primaryColors[2])
      .size(15)
      .make()
      .box
      .p8
      .border(color: ColorTheme.primaryColors[3])
      .make();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        "Create Post",
        actions: [
          CustomButton(
            child: "Post"
                .text
                .semiBold
                .color(
                  ColorTheme.primaryColors[2],
                )
                .make(),
            bgColor: Colors.transparent,
            overlayColor: ColorTheme.primaryColors[3],
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              child: Row(
                children: [
                  Image.asset(logoSm),
                  horSpacing10,
                  "Smile Garg"
                      .text
                      .semiBold
                      .size(16)
                      .color(ColorTheme.primaryColors[1])
                      .make(),
                ],
              ).p8(),
            ),
            verSpacing10,
            TextField(
              minLines: 6,
              autofocus: false,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: "What's on your mind?",
                border: OutlineInputBorder(
                  borderRadius: Sizing.borderRadius,
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: Sizing.borderRadius,
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: Sizing.borderRadius,
                  borderSide: BorderSide.none,
                ),
                fillColor: ColorTheme.primaryColors[4],
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
                "Add Image"
                    .text
                    .semiBold
                    .color(ColorTheme.primaryColors[2])
                    .make(),
                verSpacing10,
                CustomButton(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.cloud_upload_outlined,
                        size: 16,
                        color: ColorTheme.primaryColors[2],
                      ),
                      horSpacing10,
                      "Upload Image"
                          .text
                          .color(ColorTheme.primaryColors[2])
                          .make(),
                    ],
                  ),
                  overlayColor: ColorTheme.primaryColors[3],
                  onPressed: () {},
                  bgColor: ColorTheme.primaryColors[4],
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
                    .color(ColorTheme.primaryColors[2])
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
