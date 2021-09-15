import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ManualTypeView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ManualTypeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ManualTypeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
