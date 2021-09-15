import 'package:flutter/material.dart';

import 'package:get/get.dart';

class VerifyDiseaseView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VerifyDiseaseView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'VerifyDiseaseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
