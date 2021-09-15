import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/global_widgets/button.dart';
import 'package:farmer_app/app/core/theme/color_theme.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/sell_produce_controller.dart';

class SellProduceView extends GetView<SellProduceController> {
  final title = "Sell Produce";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomButton(
            child: "Submit".text.bold.make(),
            onPressed: controller.onSubmit,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            verSpacing10,
            _Heading("Crop"),
            DropdownButtonFormField<String?>(
              decoration: produceInpuDecoration("Crop"),
              onChanged: (v) {},
              value: null,
              items: [
                DropdownMenuItem<String>(
                  child: "Banana".text.make(),
                  value: "B",
                ),
              ],
            ),
            verSpacing20,
            _Heading("Variety"),
            TextFormField(
              decoration: produceInpuDecoration("Variety"),
            ),
            verSpacing20,
            _Heading("Expected Qty"),
            Row(
              children: [
                Flexible(
                  flex: 7,
                  child: TextFormField(
                    decoration: produceInpuDecoration("Expected Qty"),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: DropdownButtonFormField<String?>(
                    decoration: produceInpuDecoration("Crop"),
                    onChanged: (v) {},
                    value: "Kg",
                    items: [
                      DropdownMenuItem<String>(
                        child: "Kg".text.make(),
                        value: "Kg",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verSpacing20,
            _Heading("Expected Price"),
            Row(
              children: [
                Flexible(
                  flex: 7,
                  child: TextFormField(
                    decoration: produceInpuDecoration("Expected Qty"),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: DropdownButtonFormField<String?>(
                    decoration: produceInpuDecoration("Crop"),
                    onChanged: (v) {},
                    value: "Kg",
                    items: [
                      DropdownMenuItem<String>(
                        child: "Per Kg".text.make(),
                        value: "Kg",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verSpacing20,
            _Heading("Availability"),
            TextFormField(
              decoration: produceInpuDecoration("Availability"),
            ),
            verSpacing20,
            _Heading("Available Days"),
            TextFormField(
              decoration: produceInpuDecoration("Available Days"),
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
