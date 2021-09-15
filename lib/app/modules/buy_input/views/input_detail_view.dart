import 'package:flutter/material.dart';

import 'package:get/get.dart';

class InputDetailView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InputDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'InputDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
