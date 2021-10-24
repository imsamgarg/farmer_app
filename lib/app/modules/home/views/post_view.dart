import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_utils/spacing_utils.dart';
import 'package:farmer_app/app/core/global_widgets/app_bar.dart';
import 'package:farmer_app/app/core/theme/color_theme.dart';
import 'package:farmer_app/app/core/theme/sizing_theme.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
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
            height: 70,
            child: Row(
              children: [
                Flexible(
                  child: TextFormField(
                    validator: (v) => requiredValidator(v, 1, 50),
                    decoration: InputDecoration(
                      hintText: "Add Comment",
                      // isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(24, 12, 12, 12),
                      border: OutlineInputBorder(
                        borderRadius: Sizing.borderRadius,
                        borderSide: BorderSide(
                          width: 1.5,
                          color: primaryColor(context),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: Sizing.borderRadiusXl,
                        borderSide: BorderSide(
                          width: 1.5,
                          color: primaryColor(context),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: Sizing.borderRadiusXl,
                        borderSide: BorderSide(
                          width: 1.5,
                          color: primaryColor(context),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: Sizing.borderRadiusXl,
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Vx.red200,
                        ),
                      ),
                    ),
                    controller: controller.commentController,
                    textInputAction: TextInputAction.send,
                    onFieldSubmitted: (v) => controller.postComment(),
                  ),
                ),
                horSpacing4,
                GetBuilder(
                  init: controller,
                  id: controller.loadingId,
                  builder: (_) {
                    return AnimatedCrossFade(
                      firstChild: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(strokeWidth: 3).p8(),
                      ),
                      secondChild: IconButton(
                        onPressed: controller.postComment,
                        icon: Icon(Icons.send_rounded),
                        color: primaryColor(context),
                        iconSize: 30,
                      ),
                      crossFadeState: controller.isLoading
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: Duration(milliseconds: 200),
                    );
                  },
                )
              ],
            ).px8(),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          PostHeader(
            post: Post(
              profileImage: comment.profileImage,
              timeAgo: comment.createdAt!.toDate().difference(DateTime.now()),
              username: comment.userName,
            ),
          ),
          comment.text!.text.make().box.p8.roundedSM.gray200.make().px20(),
        ],
      ),
    );
  }
}

class _Post extends StatelessWidget {
  const _Post({Key? key, required this.post}) : super(key: key);

  final Post post;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        Divider(
          height: 5,
        ).px(20),
      ],
    );
  }
}
