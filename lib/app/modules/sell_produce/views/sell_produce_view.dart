import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sell_produce_controller.dart';

class SellProduceView extends GetView<SellProduceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SellProduceView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SellProduceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
