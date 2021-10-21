import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/data/models/post_model.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CommunityPostsController extends GetxController {
  late final pagingController = PagingController<int, Post>(firstPageKey: 0)
    ..addPageRequestListener((pageKey) {
      _fetchPosts(pageKey);
    });

  static const int fetchCount = 20;
  late final db = getDbService();
  late final QuerySnapshot<Object?> postsSnapshots;
  late final user = getAuth().currentUser;
  final String listViewId = "list-view";

  Future<void> _fetchPosts(int pageKey) async {
    final snapshots = await db.getPosts(
      count: fetchCount,
      startAfter: pageKey == 0 ? null : postsSnapshots.docs.last,
    );
    final posts = snapshots.docs.map((e) => Post.fromJson(e.data()!)).toList();
    final isLast = snapshots.docs.length < fetchCount;
    if (isLast) {
      pagingController.appendLastPage(posts);
    } else {
      pagingController.appendPage(posts, pageKey + posts.length);
    }
  }
}
