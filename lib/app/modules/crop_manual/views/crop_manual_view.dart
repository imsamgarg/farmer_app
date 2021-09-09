import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/crop_manual_controller.dart';

class CropManualView extends GetView<CropManualController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CropManualView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CropManualView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
