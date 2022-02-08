import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/global_widgets/button.dart';
import 'package:farmer_app/app/core/theme/color_theme.dart';
import 'package:farmer_app/app/core/theme/sizing_theme.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/core/utils/mixins.dart';
import 'package:flutter/material.dart';
import 'package:farmer_app/app/core/utils/extensions.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/sell_produce_controller.dart';

class SellProduceView extends GetView<SellProduceController> with Validators {
  final title = "Sell Produce";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title),
      bottomNavigationBar: Container(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder(
            init: controller,
            id: controller.buttonLoadingId,
            builder: (_) {
              return CustomButton(
                child: "Submit".text.bold.make(),
                onPressed: controller.onSubmit,
                isLoading: controller.isButtonLoading,
              );
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              verSpacing10,
              _Heading("Crop Name"),
              TextFormField(
                controller: controller.nameController,
                validator: requiredValidator,
                decoration: produceInpuDecoration("Crop Name"),
              ),
              // verSpacing20,
              // _Heading("Variety"),
              // TextFormField(
              //   decoration: produceInpuDecoration("Variety"),
              // ),
              // verSpacing20,
              // _Heading("Expected Qty"),
              // Row(
              //   children: [
              //     Flexible(
              //       flex: 7,
              //       child: TextFormField(
              //         decoration: produceInpuDecoration("Expected Qty"),
              //       ),
              //     ),
              //     Flexible(
              //       flex: 3,
              //       child: DropdownButtonFormField<String?>(
              //         decoration: produceInpuDecoration("Crop"),
              //         onChanged: (v) {},
              //         value: "Kg",
              //         items: [
              //           DropdownMenuItem<String>(
              //             child: "Kg".text.make(),
              //             value: "Kg",
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              verSpacing20,
              _Heading("Expected Price"),
              TextFormField(
                validator: requiredValidator,
                keyboardType: TextInputType.number,
                controller: controller.priceController,
                decoration: produceInpuDecoration("Expected Qty"),
              ),
              // verSpacing20,
              // _Heading("Availability"),
              // TextFormField(
              //   decoration: produceInpuDecoration("Availability"),
              // ),
              // verSpacing20,
              // _Heading("Available Days"),
              // TextFormField(
              //   decoration: produceInpuDecoration("Available Days"),
              // ),
              verSpacing20,
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
              verSpacing20,
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Add Image"
                      .text
                      .semiBold
                      .color(ColorTheme.primaryColors[2])
                      .make(),
                  verSpacing10,
                  // CustomButton(
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Icon(
                  //         Icons.cloud_upload_outlined,
                  //         size: 16,
                  //         color: ColorTheme.primaryColors[2],
                  //       ),
                  //       horSpacing10,
                  //       "Upload Image"
                  //           .text
                  //           .color(ColorTheme.primaryColors[2])
                  //           .make(),
                  //     ],
                  //   ),
                  //   overlayColor: ColorTheme.primaryColors[3],
                  //   onPressed: () {},
                  //   bgColor: ColorTheme.primaryColors[4],
                  // )
                  UploadImageButton(),
                ],
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
  const _Heading(this.heading);
  @override
  Widget build(BuildContext context) {
    return heading.text.sm.make();
  }
}

class UploadImageButton extends GetView<SellProduceController> {
  const UploadImageButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.cloud_upload_outlined, size: 16, color: Vx.white
                  // color: ColorTheme.primaryColors[2],
                  ),
              horSpacing10,
              "Upload Image"
                  .text
                  .color(
                    // ColorTheme.primaryColors[2]
                    Vx.white,
                  )
                  .make(),
            ],
          ),
          // overlayColor: ColorTheme.primaryColors[3],
          onPressed: controller.pickImage,
          // bgColor: ColorTheme.primaryColors[4],
        ),
        horSpacing10,
        GetBuilder(
          init: controller,
          id: controller.imageNameId,
          builder: (c) {
            return controller.imageName.shortImageName.text.make();
          },
        ),
      ],
    );
  }
}
