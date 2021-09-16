import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:farmer_app/app/modules/crop_manual/views/manual_type_view.dart';
import 'package:farmer_app/assets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/crop_manual_controller.dart';

class CropManualView extends GetView<CropManualController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Crop Manuals"),
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
                              Get.to(() => ManualTypeView());
                            },
                          ),
                          Crop(
                            image: Assets.to.cropPNG,
                            name: "Apple",
                            onTap: () {
                              Get.to(() => ManualTypeView());
                            },
                          ),
                          Crop(
                            image: Assets.to.cropPNG,
                            name: "Apple",
                            onTap: () {
                              Get.to(() => ManualTypeView());
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
