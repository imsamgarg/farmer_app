import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/utils/mixins.dart';
import 'package:farmer_app/app/data/models/comment_model.dart';
import 'package:farmer_app/app/modules/home/controllers/post_controller.dart';
import 'package:farmer_app/app/modules/home/local_widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PostView extends StatelessWidget with Validators {
  final controller = Get.put<PostController>(PostController());
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
                  return CommentWidget(comment: item);
                },
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Flexible(
                  child: TextFormField(
                    validator: (v) => requiredValidator(v, 1, 50),
                    key: controller.commentKey,
                    controller: controller.commentController,
                  ),
                ),
                GetBuilder(
                  init: controller,
                  id: controller.loadingId,
                  builder: (_) {
                    if (controller.isLoading)
                      return SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(),
                      );
                    return IconButton(
                      onPressed: controller.postComment,
                      icon: Icon(Icons.send_rounded),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommentWidget extends StatelessWidget {
  final Comment comment;

  const CommentWidget({Key? key, required this.comment}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(),
    );
  }
}
