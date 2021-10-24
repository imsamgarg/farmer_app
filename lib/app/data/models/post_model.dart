import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/app/data/models/comment_model.dart';

class Post {
  String? content;
  Timestamp? createdAt;
  Timestamp? updatedAt;
  Duration? timeAgo;
  String? image;
  String? profileImage;
  String? user;
  int? likesCount;
  int? commentsCount;
  late List<Comment>? comments;
  String? category;
  String? username;
  bool? isLiked;

  Post({
    this.content,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.profileImage,
    this.user,
    this.category,
    this.isLiked,
    this.username,
    this.comments,
    this.commentsCount,
    this.likesCount,
    this.timeAgo,
  });

  Post.fromJson(dynamic json) {
    content = json['content'];
    username = json['username'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    likesCount = json['likes_count'];
    commentsCount = json['comments_count'];
    profileImage = json['profile_image'];
    user = json['user'];
    isLiked = json['is_liked'] ?? false;
    category = json['category'];
    timeAgo = createdAt?.toDate().difference(DateTime.now());
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['content'] = content;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image'] = image;
    data['username'] = username;
    data['profile_image'] = profileImage;
    data['user'] = user;
    data['is_liked'] = isLiked;
    data['comments_count'] = commentsCount ?? 0;
    data['likes_count'] = likesCount ?? 0;
    data['category'] = category;
    return data;
  }
}
