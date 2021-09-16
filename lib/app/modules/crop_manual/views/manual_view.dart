import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/modules/crop_manual/views/guide_view.dart';
import 'package:farmer_app/app/modules/crop_manual/views/related_products_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ManualView extends GetView {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          "Apple / Crop Manuals",
          bottom: TabBar(tabs: [
            Tab(
              text: "Guide",
            ),
            Tab(
              text: "Related Products",
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            GuideView(),
            RelatedProductsView(),
          ],
        ),
      ),
    );
  }
}
