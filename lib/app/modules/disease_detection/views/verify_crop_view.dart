import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:farmer_app/app/modules/disease_detection/views/verify_disease_view.dart';
import 'package:farmer_app/assets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class VerifyCropView extends GetView {
  final heading = "Verify Disease";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(heading),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Crop(
                            image: Assets.to.cropPNG,
                            name: "Apple",
                            onTap: () {
                              Get.to(() => VerifyDiseaseView());
                            },
                          ),
                          Crop(
                            image: Assets.to.cropPNG,
                            name: "Apple",
                            isActive: i == 1,
                            onTap: () {
                              Get.to(() => VerifyDiseaseView());
                            },
                          ),
                          Crop(
                            image: Assets.to.cropPNG,
                            name: "Apple",
                            onTap: () {
                              Get.to(() => VerifyDiseaseView());
                            },
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
