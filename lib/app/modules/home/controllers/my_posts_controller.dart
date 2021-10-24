import 'package:farmer_app/app/core/utils/interfaces.dart';
import 'package:farmer_app/app/data/models/post_model.dart';
import 'package:get/get.dart';

class MyPostsController extends GetxController with PostInterface {
  static const int fetchCount = 20;

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }

  @override
  Future<void> fetchPosts(int pageKey) async {
    final snapshots = await db.getPosts(
      uid: user!.uid,
      count: fetchCount,
      startAfter: pageKey == 0 ? null : postsSnapshots.last,
    );
    if (pageKey == 0) {
      postsSnapshots = snapshots.docs;
    } else {
      postsSnapshots.addAll(snapshots.docs);
    }
    final posts = snapshots.docs.map((e) => Post.fromJson(e.data()!)).toList();
    if (pageKey == 0) {
      this.posts = posts.map((e) => e.obs).toList();
    } else {
      this.posts.addAll(posts.map((e) => e.obs).toList());
    }
    final isLast = snapshots.docs.length < fetchCount;
    if (isLast) {
      pagingController.appendLastPage(posts);
    } else {
      pagingController.appendPage(posts, pageKey + posts.length);
    }
  }
}
