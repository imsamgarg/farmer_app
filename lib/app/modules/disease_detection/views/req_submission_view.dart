import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ReqSubmissionView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReqSubmissionView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ReqSubmissionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
