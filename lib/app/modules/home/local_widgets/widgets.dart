import 'package:cached_network_image/cached_network_image.dart';
import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/core/utils/interfaces.dart';
import 'package:farmer_app/app/data/models/post_model.dart';
import 'package:flutter/material.dart';

import 'package:custom_utils/spacing_utils.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:farmer_app/app/core/utils/extensions.dart';
import 'package:farmer_app/app/core/theme/color_theme.dart';
import 'package:farmer_app/app/core/values/strings.dart';
import 'package:farmer_app/app/modules/home/views/notifications_view.dart';

class AppHeading extends StatelessWidget {
  const AppHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            horSpacing15,
            Image.asset(
              logoSm,
              height: 25,
              width: 25,
            ),
            horSpacing10,
            appName.text
                .size(18)
                .color(Theme.of(context).colorScheme.primary)
                .make(),
          ],
        ),
        Row(
          children: [
            InkWell(
              onTap: () => Get.to(NotificationsView()),
              child: Stack(
                children: [Icon(Icons.notifications_none_rounded)],
              ),
            ),
            horSpacing10,
          ],
        )
      ],
    );
  }
}

// class FeedAll extends StatelessWidget {
//   const FeedAll({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         FeedPost(),
//         Divider(),
//         FeedPost(),
//         Divider(),
//         FeedPost(),
//         Divider(),
//         FeedPost(),
//       ],
//     );
//   }
// }

class FeedPost extends StatelessWidget {
  const FeedPost({
    Key? key,
    this.showActions = true,
    required this.controller,
    required this.index,
    this.onCommentsTap,
  }) : super(key: key);

  final PostActionsController controller;
  final VoidCallback? onCommentsTap;
  final bool showActions;
  final int index;

  @override
  Widget build(BuildContext context) {
    var post = controller.allPosts[index].value;
    var comments = post.commentsCount;
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () {
                var likes = controller.allPosts[index].value.likesCount;
                return "$likes Likes"
                    .text
                    .sm
                    .color(ColorTheme.primaryColors[2])
                    .make();
              },
            ),
            "$comments comments"
                .text
                .sm
                .color(ColorTheme.primaryColors[2])
                .make(),
          ],
        ).px(20),
        verSpacing5,
        Divider(
          height: 5,
        ).px(20),
        if (showActions)
          PostActions(
            onCommentsTap: onCommentsTap,
            index: index,
            controller: controller,
          ),
      ],
    );
  }
}

class PostActions extends StatelessWidget {
  const PostActions({
    Key? key,
    required this.onCommentsTap,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final PostActionsController controller;
  final VoidCallback? onCommentsTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () {
              final isLiked = controller.allPosts[index].value.isLiked!;
              return PostAction(
                icon: Icons.thumb_up_alt_rounded,
                title: "Like",
                color: isLiked ? primaryColor(context) : null,
                onTap: () => controller.onLikeTap(index),
              );
            },
          ),
          PostAction(
            icon: Icons.mode_comment_outlined,
            title: "Comments",
            onTap: onCommentsTap,
          ),
          PostAction(
            icon: Icons.share_rounded,
            title: "Share",
            onTap: () => controller.onShareTap(index),
          ),
        ],
      ),
    ).px(20);
  }
}

class PostHeader extends StatelessWidget {
  const PostHeader({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              SizedBox(
                height: 35,
                width: 35,
                child: RoundedDp(
                  name: post.username,
                  url: post.profileImage ?? "",
                ),
              ),
              horSpacing15,
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (post.username ?? "Noob Coders")
                      .text
                      .size(16)
                      .semiBold
                      .color(ColorTheme.primaryColors[1])
                      .make(),
                  (post.timeAgo?.timeDifference() ?? "null")
                      .text
                      .sm
                      .color(ColorTheme.primaryColors[2])
                      .make(),
                ],
              ),
            ],
          ),
          Icon(
            Icons.more_horiz_rounded,
            color: ColorTheme.primaryColors[2],
          )
        ],
      ).px20().py16(),
    );
  }
}

class PostAction extends StatelessWidget {
  const PostAction({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
    this.color,
  }) : super(key: key);

  final IconData icon;
  final Color? color;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    var _color = color ?? ColorTheme.primaryColors[2];
    return InkWell(
      onTap: onTap,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: _color,
          ),
          title.text.xs.semiBold.size(14).color(_color).make().box.py3.make(),
        ],
      ),
    );
  }
}
