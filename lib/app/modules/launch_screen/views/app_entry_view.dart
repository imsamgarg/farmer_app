// import 'package:farmer_app/Controller/app_entry_controller.dart';
// import 'package:farmer_app/Utils/colors.dart';
import 'package:farmer_app/app/modules/launch_screen/controllers/launch_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

///This Screen will be shown each time app get opened
///The controller will read token from local storage(secured)
///if the token is null then it will navigate to welcome screen
///else to homescreen
class AppEntryView extends GetView<LaunchScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitThreeBounce(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
