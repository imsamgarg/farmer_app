import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/data/models/post_model.dart';
import 'package:farmer_app/app/modules/home/controllers/feed_controller.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CommunityPostsController extends GetxController {
  late final pagingController = PagingController<int, Post>(firstPageKey: 0)
    ..addPageRequestListener(
      (pageKey) {
        _fetchPosts(pageKey);
      },
    );

  late final feedController = Get.find<FeedController>()
    ..categoryStream.listen(
      (p0) {
        pagingController.refresh();
      },
    );

  static const int fetchCount = 20;
  late final db = getDbService();
  late final categories = feedController.categories;
  late final selectedIndex = feedController.selectedIndex;
  late final List<DocumentSnapshot> postsSnapshots;
  late final user = getAuth().currentUser;
  final String listViewId = "list-view";

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }

  Future<void> _fetchPosts(int pageKey) async {
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
    final isLast = snapshots.docs.length < fetchCount;
    if (isLast) {
      pagingController.appendLastPage(posts);
    } else {
      pagingController.appendPage(posts, pageKey + posts.length);
    }
  }
}
