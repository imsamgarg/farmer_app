import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:farmer_app/app/modules/buy_input/views/input_detail_view.dart';
import 'package:farmer_app/assets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/buy_input_controller.dart';

class BuyInputView extends GetView<BuyInputController> {
  final heading = "Buy Input";
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
                            image: Assets.to.medicPNG,
                            name: "Admire",
                            onTap: () {
                              Get.to(() => InputDetailView());
                            },
                          ),
                          Crop(
                            image: Assets.to.medicPNG,
                            name: "Admire",
                            onTap: () {
                              Get.to(() => InputDetailView());
                            },
                          ),
                          Crop(
                            image: Assets.to.medicPNG,
                            name: "Admire",
                            onTap: () {
                              Get.to(() => InputDetailView());
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
