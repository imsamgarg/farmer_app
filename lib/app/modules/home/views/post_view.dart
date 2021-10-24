import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/theme/color_theme.dart';
import 'package:farmer_app/app/core/utils/mixins.dart';
import 'package:farmer_app/app/data/models/comment_model.dart';
import 'package:farmer_app/app/data/models/post_model.dart';
import 'package:farmer_app/app/modules/home/controllers/post_controller.dart';
import 'package:farmer_app/app/modules/home/local_widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';
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
          _Post(post: controller.currentPost),
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

class _Post extends StatelessWidget {
  const _Post({Key? key, required this.post}) : super(key: key);

  final Post post;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostHeader(post: post),
        (post.category ?? "Follower")
            .text
            .color(ColorTheme.primaryColors[2])
            .semiBold
            .make()
            .box
            .p8
            .color(ColorTheme.primaryColors[4])
            .withRounded(value: 2)
            .make()
            .px(20),
        verSpacing15,
        (post.content ?? "Hello World").text.make().px20(),
        verSpacing10,
        if (post.image != null)
          CachedNetworkImage(
            imageUrl: post.image ?? "",
            height: 210,
            width: context.screenWidth,
            fit: BoxFit.fitWidth,
          ),
        verSpacing10,
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     "$likes Likes".text.sm.color(ColorTheme.primaryColors[2]).make(),
        //     "$comments comments"
        //         .text
        //         .sm
        //         .color(ColorTheme.primaryColors[2])
        //         .make(),
        //   ],
        // ).px(20),
        // verSpacing5,
        Divider(
          height: 5,
        ).px(20),
      ],
    );
  }
}
