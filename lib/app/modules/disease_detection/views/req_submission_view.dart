import 'dart:io';

import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/global_widgets/button.dart';
import 'package:farmer_app/app/core/theme/color_theme.dart';
import 'package:farmer_app/app/core/theme/sizing_theme.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/core/utils/mixins.dart';
import 'package:farmer_app/app/core/values/values.dart';
import 'package:farmer_app/app/modules/disease_detection/controllers/disease_detection_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ReqSubmissionView extends GetView<DiseaseDetectionController>
    with Validators {
  @override
  Widget build(BuildContext context) {
    var heading = 'Cure Your Crop';
    return Scaffold(
      appBar: CustomAppBar(heading),
      bottomNavigationBar: Container(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder(
            init: controller,
            id: controller.buttonLoadingId,
            builder: (_) {
              return CustomButton(
                child: "Submit".text.bold.make(),
                onPressed: controller.onReqSubmit,
                isLoading: controller.isButtonLoading,
              );
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              verSpacing10,
              _Heading("Crop Name"),
              TextFormField(
                validator: requiredValidator,
                decoration: produceInpuDecoration("Crop Name"),
                controller: controller.nameController,
              ),
              // DropdownButtonFormField<String?>(
              //   decoration: produceInpuDecoration("Crop"),
              //   onChanged: (v) {},
              //   value: "R",
              //   items: [
              //     DropdownMenuItem<String>(
              //       child: "Rice / Paddy".text.bold.make(),
              //       value: "R",
              //     ),
              //   ],
              // ),
              verSpacing20,
              // _Heading("Selected Disease"),
              // DropdownButtonFormField<String?>(
              //   decoration: produceInpuDecoration("Crop"),
              //   onChanged: (v) {},
              //   value: "R",
              //   items: [
              //     DropdownMenuItem<String>(
              //       child: "Asian Rice Gall Midge".text.bold.make(),
              //       value: "R",
              //     ),
              //   ],
              // ),
              verSpacing20,
              _Heading("Image Clicked By You"),
              verSpacing16,
              ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Container(
                  height: 250,
                  child: Image.file(
                    File(controller.image.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              verSpacing16,
              TextFormField(
                minLines: 6,
                validator: requiredValidator,
                autofocus: false,
                controller: controller.desController,
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
