import 'package:flutter/material.dart';

import 'package:get/get.dart';

class VerifyCropView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VerifyCropView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'VerifyCropView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
