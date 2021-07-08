import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:farmer_app/app/utils/button.dart';
import 'package:farmer_app/app/utils/constants.dart';
import 'package:farmer_app/app/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:velocity_x/velocity_x.dart';

class OtpView extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Enter Your Code"),
      body: Padding(
        padding: sidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(letterSpacing: 30),
                ),
                verSpacing15,
                Padding(
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
                          TextSpan(
                              text: ' and the ',
                              style: TextStyle(color: Colors.grey)),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                              text: ' and ',
                              style: TextStyle(color: Colors.grey)),
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
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                "I didn't get a code".text.center.orange400.underline.make(),
                verSpacing20,
                NextButton(controller.moveToEnterNameView),
                verSpacing5
              ],
            ),
          ],
        ),
      ),
    );
  }
}
