import 'package:flutter/material.dart';

import 'package:custom_utils/spacing_utils.dart';
import 'package:get/state_manager.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/global_widgets/button.dart';
import 'package:farmer_app/app/core/theme/sizing_theme.dart';
import 'package:farmer_app/app/modules/login/controllers/login_controller.dart';

class OtpView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Enter Your Code"),
      body: Padding(
        padding: Sizing.sidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Form(
                  key: controller.otpformKey,
                  child: TextFormField(
                    controller: controller.otpController,
                    validator: controller.otpValidator,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    style: TextStyle(letterSpacing: 30),
                  ),
                ),
                verSpacing15,
                PrivacyPolicy()
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                "I didn't get a code".text.center.orange400.underline.make(),
                verSpacing20,
                NextButton(controller.validate),
                verSpacing5
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: "Tap Continue to accept Yeoman’s ",
            style: TextStyle(
              color: Colors.grey,
              height: 1.5,
            ),
            children: [
              TextSpan(
                text: "Terms ;",
                style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: " Data"
                    " Policy Cookie use",
                style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(text: ' and the ', style: TextStyle(color: Colors.grey)),
              TextSpan(
                text: "Privacy Policy",
                style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(text: ' and ', style: TextStyle(color: Colors.grey)),
              TextSpan(
                text: 'Terms of Service ',
                style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: 'of Must ',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ]),
      ),
    );
  }
}
