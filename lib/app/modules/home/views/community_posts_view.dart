import 'package:farmer_app/app/data/models/post_model.dart';
import 'package:farmer_app/app/modules/home/controllers/community_posts_controller.dart';
import 'package:farmer_app/app/modules/home/controllers/feed_controller.dart';
import 'package:farmer_app/app/modules/home/local_widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CommunityPostsView extends GetView<CommunityPostsController> {
  final feedController = Get.find<FeedController>();
  @override
  Widget build(BuildContext context) {
    return PagedListView(
      pagingController: controller.pagingController,
      builderDelegate: PagedChildBuilderDelegate<Post>(
        itemBuilder: (c, item, i) {
          return FeedPost(
            controller: controller,
            onCommentsTap: () => feedController.onCommentsTap(
              item,
              controller.postsSnapshots[i],
            ),
            index: i,
          );
        },
      ),
    );
  }
}
