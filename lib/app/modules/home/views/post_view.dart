import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/data/models/comment_model.dart';
import 'package:farmer_app/app/modules/home/controllers/post_controller.dart';
import 'package:farmer_app/app/modules/home/local_widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PostView extends GetView<PostController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Comments"),
      body: Column(
        children: [
          FeedPost(post: controller.currentPost),
          Expanded(
            child: PagedListView(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<Comment>(
                itemBuilder: (c, item, i) {
                  return CommentWidget();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CommentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(),
    );
  }
}
