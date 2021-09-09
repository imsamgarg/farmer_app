import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SearchView extends GetView {
  final heading = "Paddy Straw Management";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(heading),
      body: Column(
        children: [
          verSpacing10,
          TextField(),
          verSpacing4,
          ListView.builder(
            itemCount: 10,
            itemBuilder: (c, i) {
              return CropDisease(name: "name", image: "image");
            },
          ),
        ],
      ),
    );
  }
}
