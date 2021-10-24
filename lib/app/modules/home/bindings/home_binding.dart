import 'package:get/get.dart';

import 'package:farmer_app/app/modules/home/controllers/community_posts_controller.dart';
import 'package:farmer_app/app/modules/home/controllers/create_post_controller.dart';
import 'package:farmer_app/app/modules/home/controllers/feed_controller.dart';
import 'package:farmer_app/app/modules/home/controllers/my_posts_controller.dart';
import 'package:farmer_app/app/modules/home/controllers/notification_controller.dart';
import 'package:farmer_app/app/modules/home/controllers/post_controller.dart';
import 'package:farmer_app/app/modules/home/controllers/profile_controller.dart';
import 'package:farmer_app/app/modules/home/controllers/profile_route_controller.dart';
import 'package:farmer_app/app/modules/home/controllers/user_controller.dart';
import 'package:farmer_app/app/modules/home/controllers/yeomen_posts_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YeomenPostsController>(
      () => YeomenPostsController(),
    );
    Get.lazyPut<MyPostsController>(
      () => MyPostsController(),
    );
    Get.lazyPut<CommunityPostsController>(
      () => CommunityPostsController(),
    );
    Get.lazyPut<FeedController>(
      () => FeedController(),
    );
    Get.lazyPut<UserController>(
      () => UserController(),
    );
    Get.lazyPut<CreatePostController>(
      () => CreatePostController(),
    );
    Get.lazyPut<ProfileRoutesController>(
      () => ProfileRoutesController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<NotificationController>(
      () => NotificationController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
