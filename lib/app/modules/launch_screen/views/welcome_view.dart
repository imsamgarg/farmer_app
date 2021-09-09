// import 'package:farmer_app/Utils/button.dart';
// import 'package:farmer_app/Utils/constants.dart';
// import 'package:farmer_app/Utils/utils.dart';
// import 'package:farmer_app/View/AuthScreens/auth_screen.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/core/values/strings.dart';
import 'package:farmer_app/app/modules/launch_screen/controllers/launch_screen_controller.dart';
import 'package:farmer_app/app/core/global_widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:velocity_x/velocity_x.dart';

///```
///Welcome Screen to be shown on first ever app start
///Scaffold Separated
///```
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _WelcomeScreen(),
    );
  }
}

class _WelcomeScreen extends GetView<LaunchScreenController> {
  ///Welcome Message
  _heading() => headingStyle("Welcome to $appName!!");

  ///App Motto Text !!!
  _motto() => messageStyle("“Rise in the seed replacement rate”");

  ///Used To Add Space b/w Widgets
  static const verSpacing = SizedBox(
    height: 10,
  );

  static const bottomSpacing = SizedBox(
    height: 20,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _heading(), //Welcome Text
                verSpacing,
                _motto(), //Motto Text
              ],
            ),
            SizedBox(
              height: 400,
              child: Center(
                child: Image.asset(logo).p(40),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(
                  onPressed: controller.getStartedButton,
                  child: Text("Get Started"),
                ),
                verSpacing,
                CustomOutlinedButton(
                    child: Text("I Already Have An Account"),
                    onPressed: controller.iHaveAnAccount),
                bottomSpacing
              ],
            ),
          ],
        ),
      ),
    );
  }
}
