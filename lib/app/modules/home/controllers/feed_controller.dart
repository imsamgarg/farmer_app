import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:farmer_app/app/data/models/post_model.dart';
import 'package:farmer_app/app/modules/home/views/post_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class FeedController extends GetxController {
  late final categories = Get.find<HomeController>().categories;

  final _selectedIndex = RxnInt(null);

  late Post currentPost;
  late DocumentSnapshot currentSnapshot;
  get selectedIndex => this._selectedIndex.value;
  set selectedIndex(value) => this._selectedIndex.value = value;

  RxnInt get categoryStream => _selectedIndex;

  void openFilters() {
    Get.bottomSheet(
      BottomSheet(
        onClosing: () {},
        builder: (c) {
          return Wrap(
            children: [
              for (var i = 0; i < categories.length; i++) ...[
                Obx(
                  () => CustomChip(
                    categories[i],
                    isActive: selectedIndex == i,
                    onTap: () => changeCategory(i),
                  ),
                ),
              ]
            ],
          );
        },
      ),
    );
  }

  void onCommentsTap(Post item, DocumentSnapshot doc) {
    currentPost = item;
    currentSnapshot = doc;
    Get.to(() => PostView());
  }

  void changeCategory(int i) {
    selectedIndex = i;
  }
}
