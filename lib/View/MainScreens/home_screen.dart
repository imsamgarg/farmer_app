import 'package:farmer_app/Utils/colors.dart';
import 'package:farmer_app/Utils/constants.dart';
import 'package:farmer_app/Utils/utils.dart';
import 'package:farmer_app/Utils/widgets.dart';
import 'package:farmer_app/View/MainScreens/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  styleChip(String text) => text.text
      .color(primaryColors[2])
      .size(15)
      .make()
      .box
      .p8
      .border(color: primaryColors[3])
      .make();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: CustomNavigationBar(
          screen: homeScreen,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: context.screenHeight * 0.2,
                child: Column(
                  children: [
                    Expanded(child: AppHeading()),
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            horSpacing15,
                            GestureDetector(
                              onTap: () {
                                // VxBottomSheet.bottomSheetView(context,
                                //     child: Container(),
                                //     roundedFromTop: true,
                                //     enableDrag: true,
                                //     maxHeight: 1,
                                //     minHeight: 0.5);
                              },
                              child: Icon(
                                Icons.filter_list,
                                size: 26,
                              ).box.p4.border(color: primaryColors[3]).make(),
                            ),
                            horSpacing5,
                            styleChip("Followers"),
                            horSpacing5,
                            styleChip("Followers"),
                            horSpacing5,
                            styleChip("Followers"),
                            horSpacing5,
                            styleChip("Followers"),
                            horSpacing5,
                            styleChip("Followers"),
                            horSpacing5,
                            styleChip("Followers"),
                            horSpacing5,
                            styleChip("Followers"),
                            horSpacing5,
                            styleChip("Followers"),
                            horSpacing5,
                          ],
                        ).scrollHorizontal(),
                      ),
                    ),
                    TabBar(tabs: [
                      Tab(
                        text: "All",
                      ),
                      Tab(
                        text: appName,
                      ),
                      Tab(
                        text: "Community",
                      )
                    ]),
                  ],
                ),
              ),
              Container(
                height: context.screenHeight * 0.8 -
                    70 -
                    context.mq.viewPadding.top,
                child: TabBarView(
                  children: [
                    FeedAll(),
                    FeedAll(),
                    FeedAll(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
                            .color(primaryColors[1])
                            .make(),
                        "1h".text.sm.color(primaryColors[2]).make(),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.more_horiz_rounded,
                  color: primaryColors[2],
                )
              ],
            ).px20().py16(),
          ),
          "Followers"
              .text
              .color(primaryColors[2])
              .make()
              .box
              .p8
              .color(primaryColors[4])
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
              "50 Likes".text.sm.color(primaryColors[2]).make(),
              "2 comments".text.sm.color(primaryColors[2]).make(),
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
                        color: accentColor,
                      ),
                      _text(
                        "Likes",
                        accentColor,
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
                        color: primaryColors[2],
                      ),
                      _text(
                        "Comments",
                        primaryColors[2],
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
                        color: primaryColors[2],
                      ),
                      _text(
                        "Share",
                        primaryColors[2],
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
