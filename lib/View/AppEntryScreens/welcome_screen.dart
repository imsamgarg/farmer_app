import 'package:farmer_app/Utils/button.dart';
import 'package:farmer_app/Utils/constants.dart';
import 'package:farmer_app/Utils/utils.dart';
import 'package:farmer_app/View/AuthScreens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';
import 'get_started_screen.dart';

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

class _WelcomeScreen extends StatelessWidget {
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
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _heading(), //Welcome Text
                  verSpacing,
                  _motto(), //Motto Text
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: SizedBox(
                child: Center(
                  child: Image.asset(logo).p(40),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      onPressed: () => Get.to(() => GetStartedScreen(),
                          transition: Transition.rightToLeftWithFade),
                      child: Text("Get Started"),
                    ),
                    verSpacing,
                    CustomOutlinedButton(
                      child: Text("I Already Have An Account"),
                      onPressed: () => Get.to(
                        () => AuthScreen(
                          isNew: false,
                        ),
                      ),
                    ),
                    bottomSpacing
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
