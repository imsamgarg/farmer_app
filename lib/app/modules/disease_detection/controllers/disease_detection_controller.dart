import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/global_widgets/button.dart';
import 'package:farmer_app/app/core/values/values.dart';
import 'package:farmer_app/app/modules/disease_detection/views/disease_detection_view.dart';
import 'package:farmer_app/app/modules/disease_detection/views/req_submission_view.dart';
import 'package:farmer_app/app/modules/disease_detection/views/verify_crop_view.dart';
import 'package:farmer_app/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class DiseaseDetectionController extends GetxController {
  void onSubmit() {
    //TODO : ethe change krna ok?
    Get.to(() => VerifyCropView());
  }

  void onDiseaseSelect(int row, int col) {
    Get.bottomSheet(
      BottomSheet(
        backgroundColor: Vx.white,
        onClosing: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              10,
            ),
          ),
        ),
        builder: (c) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Infected Leaf".text.bold.make(),
                    Icon(
                      Icons.close,
                      size: 20,
                    ).onTap(() {
                      Get.back();
                    }),
                  ],
                ),
                Divider(
                  thickness: 1,
                  height: 20,
                ),
                verSpacing10,
                ClipRRect(
                  borderRadius: BorderRadius.circular(radius),
                  child: SizedBox(
                    height: 230,
                    child: Image.asset(
                      Assets.to.diseaseFullPNG,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                verSpacing20,
                CustomButton(
                  child:
                      "Yes! This image is close to my problem".text.bold.make(),
                  onPressed: () {
                    Get.to(() => ReqSubmissionView());
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void onReqSubmit() {
    Get.to(() => DiseaseDetectionView());
  }
}
