import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/data/models/post_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

abstract class PostActionsController {
  List<Rx<Post>> get allPosts;

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

  void onShareTap(int index) {
    errorSnackbar("Not Implemented");
  }
}
