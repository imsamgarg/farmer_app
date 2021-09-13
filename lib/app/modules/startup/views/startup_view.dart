import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

// import 'package:farmer_app/Controller/app_entry_controller.dart';
// import 'package:farmer_app/Utils/colors.dart';

///This Screen will be shown each time app get opened
///The controller will read token from local storage(secured)
///if the token is null then it will navigate to welcome screen
///else to homescreen
class StartupView extends StatelessWidget {
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
