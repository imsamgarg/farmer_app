import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/global_widgets/button.dart';
import 'package:farmer_app/app/core/theme/sizing_theme.dart';
import 'package:farmer_app/app/modules/register/controllers/register_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EnterNameView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Enter Your Name"),
      body: Padding(
        padding: Sizing.sidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: controller.nameFormKey,
              child: TextFormField(
                controller: controller.nameController,
                validator: controller.nameValidotor,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: "Enter Your Name ",
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GetBuilder<RegisterController>(
                  init: controller,
                  id: controller.enterNameButtonId,
                  builder: (_) {
                    return CustomButton(
                      child: Text("Get Started"),
                      onPressed: controller.registerUserName,
                      isLoading: controller.enterNameButtonLoading,
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
