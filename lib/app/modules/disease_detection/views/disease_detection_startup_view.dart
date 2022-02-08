import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/global_widgets/button.dart';
import 'package:farmer_app/app/modules/disease_detection/controllers/disease_detection_controller.dart';
import 'package:farmer_app/assets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class DiseaseDetectionStartupView extends GetView<DiseaseDetectionController> {
  final String heading = "Disease Detection";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(heading),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomButton(
            child: "New Request".text.bold.make(),
            onPressed: controller.onSubmit,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Assets.to.diseaseLogoPNG),
            verSpacing12,
            "Add Disease Detection request"
                .text
                .semiBold
                .size(16)
                .color(Theme.of(context).colorScheme.primary)
                .make(),
          ],
        ),
      ),
    );
  }
}
