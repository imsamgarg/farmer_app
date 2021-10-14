import 'package:custom_utils/future.dart';
import 'package:farmer_app/app/core/global_widgets/widgets.dart';
import 'package:farmer_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:farmer_app/app/modules/home/local_widgets/navigation_bar.dart';
import 'package:farmer_app/app/modules/home/views/create_post_view.dart';
import 'package:farmer_app/app/modules/home/views/feed_view.dart';

import 'profile_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
      loading: CenterLoading(),
      future: controller.instance,
      builder: (_) {
        return Scaffold(
          bottomNavigationBar: CustomBottomNavBar(),
          body: Obx(
            () => IndexedStack(
              children: [
                FeedView(),
                CreatePostView(),
                ProfileView(),
              ],
              index: controller.pageIndex,
            ),
          ),
        );
      },
    );
  }
}
