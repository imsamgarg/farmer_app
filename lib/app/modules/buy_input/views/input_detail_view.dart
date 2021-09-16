import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/assets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class InputDetailView extends GetView {
  final heading = "Buy Input";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(heading),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            Material(
              type: MaterialType.circle,
              color: Vx.gray100,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  Assets.to.medicPNG,
                  height: 120,
                  width: 120,
                ),
              ),
            ),
            verSpacing12,
            "Admire"
                .text
                .bold
                .center
                .size(22)
                .color(Theme.of(context).colorScheme.primary)
                .make(),
            _Heading("Quantity"),
            DropdownButtonFormField<String?>(
              decoration: produceInpuDecoration("Crop"),
              onChanged: (v) {},
              value: "B",
              items: [
                DropdownMenuItem<String>(
                  child: "60 gm".text.bold.make(),
                  value: "B",
                ),
              ],
            ),
            verSpacing24,
            _Heading("Price"),
            TextFormField(
              style: TextStyle(fontWeight: FontWeight.bold),
              initialValue: "Rs.200",
              decoration: produceInpuDecoration("text"),
            ),
            verSpacing24,
            _Heading("About"),
            verSpacing24,
            "Admire is a pesticide that protects our crop from insect such as sap"
                .text
                .bold
                .size(16)
                .make(),
            verSpacing24,
            """• Chemical Composition - Amidacloprid 70 W.G.
• Product Category - Pesticides
• Target insects - aphid, beetles and flies
• Dose rate - 25-30 g / acre
• Target crops - wheat, paddy, leafy vegetable, mango, litchi 
• Method of use - spraying
• Packing - 16 grams
• Duration of effect - 7-10 days
• Toxicity Color Code - Yellow"""
                .text
                .lineHeight(1.5)
                .make(),
            verSpacing24,
          ],
        ),
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  final String heading;
  const _Heading(this.heading);
  @override
  Widget build(BuildContext context) {
    return heading.text.sm.make();
  }
}
