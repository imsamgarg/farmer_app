import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DiseaseDetectionStartupView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DiseaseDetectionStartupView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DiseaseDetectionStartupView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
