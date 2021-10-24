import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/data/models/post_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

abstract class PostInterface {
  List<Rx<Post>> get allPosts => posts;
  late final db = getDbService();
  late final List<DocumentSnapshot> postsSnapshots;
  late final List<Rx<Post>> posts;

  late final user = getAuth().currentUser;
  void onLikeTap(int index) {
    allPosts[index].update((post) {
      if (post!.isLiked!) {
        post.likesCount = post.likesCount! - 1;
      } else {
        post.likesCount = post.likesCount! + 1;
      }
      final newVal = !post.isLiked!;
      post.isLiked = newVal;
    });
  }

  late final pagingController = PagingController<int, Post>(firstPageKey: 0)
    ..addPageRequestListener(
      (pageKey) {
        fetchPosts(pageKey);
      },
    );

  void onShareTap(int index) {
    errorSnackbar("Not Implemented");
  }

  Future<void> fetchPosts(int pageKey);
}
