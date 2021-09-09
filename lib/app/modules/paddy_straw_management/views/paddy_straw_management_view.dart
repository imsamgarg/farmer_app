import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/paddy_straw_management_controller.dart';

class PaddyStrawManagementView extends GetView<PaddyStrawManagementController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaddyStrawManagementView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PaddyStrawManagementView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
