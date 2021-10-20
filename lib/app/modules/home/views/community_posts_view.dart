import 'package:farmer_app/app/modules/home/controllers/community_posts_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CommunityPostsView extends GetView<CommunityPostsController> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller.scrollController,
      itemBuilder: (c, i) {
        return Container();
      },
    );
  }
}
