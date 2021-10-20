import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:farmer_app/app/modules/home/controllers/feed_controller.dart';
import 'package:farmer_app/app/modules/home/views/community_posts_view.dart';
import 'package:farmer_app/app/modules/home/views/my_posts_view.dart';
import 'package:farmer_app/app/modules/home/views/yeomen_posts_view.dart';
import 'package:flutter/material.dart';

import 'package:custom_utils/spacing_utils.dart';
import 'package:get/state_manager.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:farmer_app/app/core/theme/color_theme.dart';
import 'package:farmer_app/app/core/values/strings.dart';
import 'package:farmer_app/app/modules/home/local_widgets/widgets.dart';

class FeedView extends GetView<FeedController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Filters(),
              Container(
                height: context.screenHeight * 0.8 -
                    70 -
                    context.mq.viewPadding.top,
                child: TabBarView(
                  children: [
                    CommunityPostsView(),
                    YeomenPostsView(),
                    MyPostsView(),
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

class Filters extends GetView<FeedController> {
  late final categories = controller.categories;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    onTap: controller.openFilters,
                    child: Icon(
                      Icons.filter_list,
                      size: 26,
                    ).box.p4.border(color: ColorTheme.primaryColors[3]).make(),
                  ),
                  horSpacing5,
                  for (var i = 0; i < categories.length; i++) ...[
                    horSpacing5,
                    CustomChip(categories[i]),
                  ]
                ],
              ).scrollHorizontal(),
            ),
          ),
          TabBar(tabs: [
            Tab(
              text: "Community",
            ),
            Tab(
              text: appName,
            ),
            Tab(
              text: "My",
            )
          ]),
        ],
      ),
    );
  }
}
