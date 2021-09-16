import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/global_widgets/button.dart';
import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/disease_detection_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class DiseaseDetectionView extends GetView<DiseaseDetectionController> {
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
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (c, i) {
          return RequestStatusCard(
            heading: "Issue No: 6969",
            message:
                "issue: Note Available day 0 crop name banana crop varity crop quailty 5 crate price unit 0.0 per crate expected date 18-jan-2019.",
          );
        },
      ),
    );
  }
}
