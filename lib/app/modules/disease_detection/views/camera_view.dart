import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CameraView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CameraView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CameraView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
