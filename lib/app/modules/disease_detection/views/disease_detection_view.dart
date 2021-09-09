import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/disease_detection_controller.dart';

class DiseaseDetectionView extends GetView<DiseaseDetectionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DiseaseDetectionView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DiseaseDetectionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
