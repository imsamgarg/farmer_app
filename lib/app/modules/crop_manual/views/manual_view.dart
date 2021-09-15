import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ManualView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ManualView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ManualView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
