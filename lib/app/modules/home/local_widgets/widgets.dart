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
              onTap: () {
                Get.to(NotificationsView());
              },
              child: Stack(
                children: [
                  Icon(Icons.notifications_none_rounded),
                ],
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
  _text(String text, Color color) =>
      text.text.xs.semiBold.size(14).color(color).make().box.py3.make();

  @override
  Widget build(BuildContext context) {
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
                    Image.asset(logo),
                    horSpacing15,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Yoemen Team"
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
          "Followers"
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
          "Although, transformational leadership is among the most thoroughly examined leadership theories, knowledge regarding its association with followers' career outcomes is still limited. Furthermore, the underlyin....see more"
              .text
              .make()
              .px20(),
          verSpacing10,
          Image.asset(
            "assets/feedimage.jpg",
            height: 210,
            width: context.screenWidth,
            fit: BoxFit.fitWidth,
          ),
          verSpacing10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "50 Likes".text.sm.color(ColorTheme.primaryColors[2]).make(),
              "2 comments".text.sm.color(ColorTheme.primaryColors[2]).make(),
              // "8 comments".text.make(),
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
                InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.thumb_up,
                        color: ColorTheme.accentColor,
                      ),
                      _text(
                        "Likes",
                        ColorTheme.accentColor,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.mode_comment_outlined,
                        color: ColorTheme.primaryColors[2],
                      ),
                      _text(
                        "Comments",
                        ColorTheme.primaryColors[2],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.share_rounded,
                        color: ColorTheme.primaryColors[2],
                      ),
                      _text(
                        "Share",
                        ColorTheme.primaryColors[2],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).px(20),
        ],
      ),
    );
  }
}
