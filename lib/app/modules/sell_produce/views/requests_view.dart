import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RequestsView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RequestsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RequestsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
