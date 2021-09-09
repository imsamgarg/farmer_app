import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/theme/sizing_theme.dart';
import 'package:farmer_app/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:farmer_app/app/core/global_widgets/button.dart';
import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthView extends GetView<AuthenticationController> {
  final bool isNew;

  AuthView({Key? key, this.isNew = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isNew ? "Create An Acount" : "Welcome Back!!"),
      body: Padding(
        padding: Sizing.sidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                prefixIcon: Padding(
                    padding: EdgeInsets.all(12),
                    child: "🇮🇳 +91 ".text.size(16).make()),
                prefixStyle: TextStyle(color: Colors.black, fontSize: 16),
                hintText: "Enter Mobile Number",
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NextButton(controller.moveToOtpView),
                verSpacing5,
              ],
            )
          ],
        ),
      ),
    );
  }
}
