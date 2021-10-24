import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/app/core/global_widgets/button.dart';
import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:farmer_app/app/data/models/post_model.dart';
import 'package:farmer_app/app/modules/home/views/post_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class FeedController extends GetxController {
  late final categories = Get.find<HomeController>().categories;

  final _selectedIndex = RxnInt(null);

  late Rx<Post> _currentPost;
  late Post currentPost;
  late DocumentSnapshot currentSnapshot;
  get selectedIndex => this._selectedIndex.value;
  set selectedIndex(value) => this._selectedIndex.value = value;

  RxnInt get categoryStream => _selectedIndex;

  void openFilters() {
    Get.bottomSheet(
      BottomSheet(
        onClosing: () {},
        backgroundColor: Vx.white,
        builder: (c) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Wrap(
                children: [
                  for (var i = 0; i < categories.length; i++) ...[
                    Obx(
                      () => CustomChip(
                        categories[i],
                        isActive: selectedIndex == i,
                        onTap: () => changeCategory(i),
                      ).px8().py4(),
                    ),
                  ]
                ],
              ).p16(),
              CustomButton(
                child: Text('Reset'),
                onPressed: resetCategory,
              ).px16().py8(),
            ],
          );
        },
      ),
    );
  }

  void onCommentsTap(Rx<Post> item, DocumentSnapshot doc) {
    _currentPost = item;
    currentPost = _currentPost.value;
    currentSnapshot = doc;
    Get.to(() => PostView());
  }

  void changeCategory(int i) {
    selectedIndex = i;
  }

  void resetCategory() {
    selectedIndex = null;
  }

  void incrementCommentsCount() {
    _currentPost.update((val) {
      val!.commentsCount = val.commentsCount! + 1;
    });
  }
}
