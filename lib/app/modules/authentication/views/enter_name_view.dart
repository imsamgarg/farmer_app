import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/theme/sizing_theme.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:farmer_app/app/core/global_widgets/button.dart';
import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class EnterNameView extends GetView<AuthenticationController> {
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
            TextField(
              decoration: inputDecor(hint: "Enter Your Name"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(
                  child: Text("Get Started"),
                  onPressed: controller.moveToHomeView,
                ),
                verSpacing5,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
