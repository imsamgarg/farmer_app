import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_utils/log_utils.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/data/models/comment_model.dart';
import 'package:farmer_app/app/modules/home/controllers/feed_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PostController extends GetxController {
  late final feedController = Get.find<FeedController>();
  late final currentPost = feedController.currentPost;
  late final currentSnapshot = feedController.currentSnapshot;
  late final commentController = TextEditingController();

  late final pagingController = PagingController<int, Comment>(firstPageKey: 0)
    ..addPageRequestListener((pageKey) {
      _fetchComments(pageKey);
    });

  @override
  void onClose() {
    pagingController.dispose();
    commentController.dispose();
    super.onClose();
  }

  static const int fetchCount = 15;
  final String loadingId = 'loading';
  bool isLoading = false;

  late final db = getDbService();
  late final user = getAuth().currentUser;
  late List<DocumentSnapshot> commentSnapshots;

  Future<void> _fetchComments(int pageKey) async {
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

  void postComment() async {
    if (commentController.text.isEmpty) {
      errorSnackbar("Please Enter Some Text");
      return;
    }
    try {
      toggleLoading(true);
      final uid = user!.uid;
      final userName = user!.displayName ?? "";
      final profileImage = user!.photoURL ?? "";
      final content = commentController.text;
      final postId = currentSnapshot.id;
      await getDbService().postComment(
        uid: uid,
        content: content,
        postId: postId,
        userName: userName,
        profileImage: profileImage,
      );
      feedController.incrementCommentsCount();
      successSnackbar("Comment Posted", 4, SnackPosition.TOP);
      commentController.clear();
      pagingController.refresh();
    } on Exception {
      errorSnackbar("Failed To Post Comment");
    } finally {
      toggleLoading(false);
    }
  }

  void toggleLoading(bool value) {
    isLoading = value;
    update([loadingId]);
  }
}
