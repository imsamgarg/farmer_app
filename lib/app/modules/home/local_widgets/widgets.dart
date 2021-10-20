import 'package:cached_network_image/cached_network_image.dart';
import 'package:farmer_app/app/data/models/post_model.dart';
import 'package:flutter/material.dart';

import 'package:custom_utils/spacing_utils.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

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

class FeedAll extends StatelessWidget {
  const FeedAll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _FeedPost(),
        Divider(),
        _FeedPost(),
        Divider(),
        _FeedPost(),
        Divider(),
        _FeedPost(),
      ],
    );
  }
}

class _FeedPost extends StatelessWidget {
  const _FeedPost({
    Key? key,
    this.post,
    this.isLiked = false,
  }) : super(key: key);

  final Post? post;
  final bool isLiked;
  @override
  Widget build(BuildContext context) {
    var likes = post?.likesCount;
    var comments = post?.commentsCount;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    CachedNetworkImage(imageUrl: post?.profileImage ?? ""),
                    horSpacing15,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (post?.username ?? "Noob Coders")
                            .text
                            .size(16)
                            .semiBold
                            .color(ColorTheme.primaryColors[1])
                            .make(),
                        "1h".text.sm.color(ColorTheme.primaryColors[2]).make(),
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
          ),
          (post?.category ?? "Follower")
              .text
              .color(ColorTheme.primaryColors[2])
              .make()
              .box
              .p8
              .color(ColorTheme.primaryColors[4])
              .withRounded(value: 2)
              .make()
              .px(20),
          verSpacing5,
          (post?.content ?? "Hello World").text.make().px20(),
          verSpacing10,
          if (post?.image != null)
            CachedNetworkImage(
              imageUrl: post?.image ?? "",
              height: 210,
              width: context.screenWidth,
              fit: BoxFit.fitWidth,
            ),
          verSpacing10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "$likes Likes".text.sm.color(ColorTheme.primaryColors[2]).make(),
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
          Container(
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PostAction(
                  icon: Icons.thumb_up_alt_rounded,
                  title: "Like",
                ),
                PostAction(
                  icon: Icons.mode_comment_outlined,
                  title: "Comments",
                ),
                PostAction(
                  icon: Icons.share_rounded,
                  title: "Share",
                ),
              ],
            ),
          ).px(20),
        ],
      ),
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
