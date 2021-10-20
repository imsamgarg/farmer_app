import 'package:custom_utils/future.dart';
import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:farmer_app/app/modules/home/controllers/my_posts_controller.dart';
import 'package:farmer_app/app/modules/home/local_widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MyPostsView extends GetView<MyPostsController> {
  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
      loading: CenterLoading(),
      future: controller.instance,
      builder: (context) {
        return GetBuilder(
          id: controller.listViewId,
          init: controller,
          builder: (_) {
            return ListView.builder(
              controller: controller.scrollController,
              itemCount: controller.postsCount,
              itemBuilder: (c, i) {
                return FeedPost(post: controller.posts[i]);
              },
            );
          },
        );
      },
    );
  }
}
