import 'package:flutter/material.dart';

import 'package:custom_utils/spacing_utils.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/global_widgets/button.dart';
import 'package:farmer_app/app/core/theme/sizing_theme.dart';
import 'package:farmer_app/app/modules/register/controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    final heading = Get.parameters['isNewUser'] ?? "Create An Account";
    return Scaffold(
      appBar: CustomAppBar(heading),
      body: Padding(
        padding: Sizing.sidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: controller.phoneFormkey,
              child: TextFormField(
                keyboardType: TextInputType.number,
                validator: (v) => controller.phoneNumberValidator(v, 11),
                textInputAction: TextInputAction.done,
                controller: controller.phoneController,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                      padding: EdgeInsets.all(12),
                      child: "🇮🇳 +91 ".text.size(16).make()),
                  prefixStyle: TextStyle(color: Colors.black, fontSize: 16),
                  hintText: "Enter Mobile Number",
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GetBuilder(
                  init: controller,
                  id: controller.sendOtpButtonId,
                  builder: (_) {
                    return NextButton(
                      controller.sendOtp,
                      isLoading: controller.sendOtpButtonLoading,
                    );
                  },
                ),
                verSpacing5,
              ],
            )
          ],
        ),
      ),
    );
  }
}
