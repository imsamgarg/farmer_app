import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/data/models/comment_model.dart';
import 'package:farmer_app/app/modules/home/controllers/feed_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PostController extends GetxController {
  late final feedController = Get.find<FeedController>();
  late final currentPost = feedController.currentPost;
  late final currentSnapshot = feedController.currentSnapshot;
  late final commentController = TextEditingController();

  late final pagingController = PagingController<int, Comment>(firstPageKey: 0)
    ..addPageRequestListener((pageKey) {
      _fetchPosts(pageKey);
    });

  @override
  void onClose() {
    pagingController.dispose();
    commentController.dispose();
    super.onClose();
  }

  static const int fetchCount = 15;

  late final db = getDbService();
  late final List<DocumentSnapshot> commentSnapshots;

  Future<void> _fetchPosts(int pageKey) async {
    final snapshots = await db.getComments(
      postId: currentSnapshot.id,
      count: fetchCount,
      startAfter: pageKey == 0 ? null : commentSnapshots.last,
    );
    if (pageKey == 0) {
      commentSnapshots = snapshots.docs;
    } else {
      commentSnapshots.addAll(snapshots.docs);
    }
    final comments = snapshots.docs
        .map(
          (e) => Comment.fromJson(e.data()!),
        )
        .toList();
    final isLast = snapshots.docs.length < fetchCount;
    if (isLast) {
      pagingController.appendLastPage(comments);
    } else {
      pagingController.appendPage(comments, pageKey + comments.length);
    }
  }
}
