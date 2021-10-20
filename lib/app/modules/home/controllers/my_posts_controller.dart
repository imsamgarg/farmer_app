import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:farmer_app/app/data/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPostsController extends GetxController {
  late final scrollController = ScrollController();
  late final instance = _getInitialData();
  late final List<Post> posts;
  int get postsCount => posts.length;
  late final user = getAuth().currentUser;
  final String listViewId = "list-view";

  Future<bool> _getInitialData() async {
    final snapshots = await getDbService().getPosts(uid: user!.uid, count: 20);
    posts = snapshots.docs.map((e) => Post.fromJson(e.data()!)).toList();
    return true;
  }
}
