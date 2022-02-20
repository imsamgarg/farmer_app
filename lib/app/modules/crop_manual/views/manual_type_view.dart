import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:farmer_app/app/modules/crop_manual/controllers/crop_manual_controller.dart';
import 'package:farmer_app/assets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class ManualTypeView extends GetView<CropManualController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Apple / Crop Manuals"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            verSpacing10,
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
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     CropDisease(
                      //       name: "Bfgi",
                      //       image: Assets.to.diseasePNG,
                      //     ).onTap(() => controller.onDiseaseSelect(i, 0)),
                      //     CropDisease(
                      //       name: "Bfgi",
                      //       image: Assets.to.diseasePNG,
                      //       isActive: i == 0,
                      //     ).onTap(() => controller.onDiseaseSelect(i, 0)),
                      //     CropDisease(
                      //       name: "Bfgi",
                      //       image: Assets.to.diseasePNG,
                      //     ).onTap(() => controller.onDiseaseSelect(i, 0)),
                      //   ],
                      // ),
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
