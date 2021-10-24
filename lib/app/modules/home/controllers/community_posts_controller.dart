import 'package:farmer_app/app/core/utils/interfaces.dart';
import 'package:farmer_app/app/data/models/post_model.dart';
import 'package:farmer_app/app/modules/home/controllers/feed_controller.dart';
import 'package:get/get.dart';

class CommunityPostsController extends GetxController with PostInterface {
  late final feedController = Get.find<FeedController>()
    ..categoryStream.listen(
      (p0) {
        pagingController.refresh();
      },
    );

  static const int fetchCount = 20;
  late final categories = feedController.categories;
  late final selectedIndex = feedController.selectedIndex;

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }

  Future<void> fetchPosts(int pageKey) async {
    final category = selectedIndex != null ? categories[selectedIndex] : null;
    final snapshots = await db.getPosts(
      count: fetchCount,
      category: category,
      startAfter: pageKey == 0 ? null : postsSnapshots.last,
    );
    if (pageKey == 0) {
      postsSnapshots = snapshots.docs;
    } else {
      postsSnapshots.addAll(snapshots.docs);
    }
    final posts = snapshots.docs.map((e) => Post.fromJson(e.data()!)).toList();
    this.posts = posts.map((e) => e.obs).toList();
    final isLast = snapshots.docs.length < fetchCount;
    if (isLast) {
      pagingController.appendLastPage(posts);
    } else {
      pagingController.appendPage(posts, pageKey + posts.length);
    }
  }
}
