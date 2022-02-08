import 'package:farmer_app/app/data/models/post_model.dart';
import 'package:farmer_app/app/modules/home/controllers/feed_controller.dart';
import 'package:farmer_app/app/modules/home/controllers/my_posts_controller.dart';
import 'package:farmer_app/app/modules/home/local_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MyPostsView extends GetView<MyPostsController> {
  final feedController = Get.find<FeedController>();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.refreshPage,
      child: PagedListView(
        pagingController: controller.pagingController,
        builderDelegate: PagedChildBuilderDelegate<Post>(
          itemBuilder: (c, item, i) {
            final showActions = item.category != 'Buy Crop';
            return FeedPost(
              controller: controller,
              index: i,
              showActions: showActions,
              onCommentsTap: () => feedController.onCommentsTap(
                controller.allPosts[i],
                controller.postsSnapshots[i],
              ),
            );
          },
        ),
      ),
    );
  }
}
