import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/core/utils/interfaces.dart';
import 'package:farmer_app/app/data/models/post_model.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MyPostsController extends GetxController with PostActionsController {
  late final pagingController = PagingController<int, Post>(firstPageKey: 0)
    ..addPageRequestListener((pageKey) {
      _fetchPosts(pageKey);
    });

  static const int fetchCount = 20;

  late final List<Rx<Post>> posts;
  late final db = getDbService();
  late final List<DocumentSnapshot> postsSnapshots;
  late final user = getAuth().currentUser;

  Future<void> _fetchPosts(int pageKey) async {
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
    this.posts = posts.map((e) => e.obs).toList();
    final isLast = snapshots.docs.length < fetchCount;
    if (isLast) {
      pagingController.appendLastPage(posts);
    } else {
      pagingController.appendPage(posts, pageKey + posts.length);
    }
  }

  @override
  List<Rx<Post>> get allPosts => posts;
}
