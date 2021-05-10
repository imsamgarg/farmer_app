import 'package:farmer_app/Utils/utils.dart';
import 'package:farmer_app/Utils/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        screen: homeScreen,
      ),
      body: Center(
        child: Text("BINGO!!"),
      ),
    );
  }
}
