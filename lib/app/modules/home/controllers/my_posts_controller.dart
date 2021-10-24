import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/data/models/post_model.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MyPostsController extends GetxController {
  late final pagingController = PagingController<int, Post>(firstPageKey: 0)
    ..addPageRequestListener((pageKey) {
      _fetchPosts(pageKey);
    });

  static const int fetchCount = 20;

  // late final instance = _getInitialData();
  // late final List<Post> posts;
  late final db = getDbService();
  late final List<DocumentSnapshot> postsSnapshots;
  // int get postsCount => posts.length;
  late final user = getAuth().currentUser;
  final String listViewId = "list-view";

  // Future<bool> _getInitialData() async {
  //   final snapshots = await db.getPosts(uid: user!.uid, count: fetchCount);
  //   postsSnapshots = snapshots;
  //   // posts = snapshots.docs.map((e) => Post.fromJson(e.data()!)).toList();
  //   return true;
  // }

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
    final isLast = snapshots.docs.length < fetchCount;
    if (isLast) {
      pagingController.appendLastPage(posts);
    } else {
      pagingController.appendPage(posts, pageKey + posts.length);
    }
  }
}
