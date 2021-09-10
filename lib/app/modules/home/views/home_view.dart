import 'package:farmer_app/app/modules/home/local_widgets/navigation_bar.dart';
import 'package:farmer_app/app/modules/home/views/create_post_view.dart';
import 'package:farmer_app/app/modules/home/views/feed_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: Obx(
        () => IndexedStack(
          children: [
            FeedView(),
            CreatePostView(),
            ProfileView(),
          ],
        ),
      ),
    );
  }
}
