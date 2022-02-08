import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:farmer_app/app/modules/disease_detection/controllers/disease_detection_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../assets.dart';

class VerifyDiseaseView extends GetView<DiseaseDetectionController> {
  final String heading = "Verify Disease";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(heading),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            verSpacing20,
            "Paddy/Rice".text.bold.make(),
            verSpacing28,
            SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                ),
              ),
            ),
            verSpacing10,
            Expanded(
              child: ListView.builder(
                itemBuilder: (c, i) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CropDisease(
                            name: "Bfgi",
                            image: Assets.to.diseasePNG,
                          ),
                          // onTap(() => controller.onDiseaseSelect(i, 0)),
                          CropDisease(
                            name: "Bfgi",
                            image: Assets.to.diseasePNG,
                            isActive: i == 0,
                          ),
                          CropDisease(
                            name: "Bfgi",
                            image: Assets.to.diseasePNG,
                          ),
                        ],
                      ),
                      verSpacing32,
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
