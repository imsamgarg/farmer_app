import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
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
            verSliverSpacing12,
            for (var i = 0; i < controller.links.length; i++) ...[
              TextButton(
                onPressed: () => controller.openLink(i),
                child: Text(controller.links[i]),
              ),
              verSpacing10,
            ]
            // verSpacing10,
            // SizedBox(
            //   height: 50,
            //   child: TextField(
            //     decoration: InputDecoration(
            //       prefixIcon: Icon(Icons.search),
            //       hintText: "Search",
            //     ),
            //   ),
            // ),

            // Expanded(
            //   child: ListView.builder(
            //     itemBuilder: (c, i) {
            //       return Column(
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Crop(
            //                 image: Assets.to.cropPNG,
            //                 name: "Apple",
            //                 onTap: () {
            //                   Get.to(() => ManualTypeView());
            //                 },
            //               ),
            //               Crop(
            //                 image: Assets.to.cropPNG,
            //                 name: "Apple",
            //                 onTap: () {
            //                   Get.to(() => ManualTypeView());
            //                 },
            //               ),
            //               Crop(
            //                 image: Assets.to.cropPNG,
            //                 name: "Apple",
            //                 onTap: () {
            //                   Get.to(() => ManualTypeView());
            //                 },
            //               ),
            //             ],
            //           ),
            //           verSpacing32,
            //         ],
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
