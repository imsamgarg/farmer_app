import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/global_widgets/button.dart';
import 'package:farmer_app/app/core/theme/color_theme.dart';
import 'package:farmer_app/app/core/theme/sizing_theme.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/core/values/values.dart';
import 'package:farmer_app/app/modules/disease_detection/controllers/disease_detection_controller.dart';
import 'package:farmer_app/assets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ReqSubmissionView extends GetView<DiseaseDetectionController> {
  @override
  Widget build(BuildContext context) {
    var heading = 'Cure Your Crop';
    return Scaffold(
      appBar: CustomAppBar(heading),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomButton(
            child: "Submit".text.bold.make(),
            onPressed: controller.onReqSubmit,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            verSpacing10,
            _Heading("Selected Crop"),
            DropdownButtonFormField<String?>(
              decoration: produceInpuDecoration("Crop"),
              onChanged: (v) {},
              value: "R",
              items: [
                DropdownMenuItem<String>(
                  child: "Rice / Paddy".text.bold.make(),
                  value: "R",
                ),
              ],
            ),
            verSpacing20,
            _Heading("Selected Disease"),
            DropdownButtonFormField<String?>(
              decoration: produceInpuDecoration("Crop"),
              onChanged: (v) {},
              value: "R",
              items: [
                DropdownMenuItem<String>(
                  child: "Asian Rice Gall Midge".text.bold.make(),
                  value: "R",
                ),
              ],
            ),
            verSpacing20,
            _Heading("Image Clicked By You"),
            verSpacing16,
            ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Container(
                height: 250,
                child: Image.asset(
                  Assets.to.diseaseFullPNG,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            verSpacing16,
            TextField(
              minLines: 6,
              autofocus: false,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: "Explain Your Problem",
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  final String heading;

  _Heading(this.heading);
  @override
  Widget build(BuildContext context) {
    return heading.text.make();
  }
}
