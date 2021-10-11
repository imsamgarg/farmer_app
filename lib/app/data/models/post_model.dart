import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String? content;
  Timestamp? createdAt;
  Timestamp? updatedAt;
  String? image;
  String? user;
  String? category;

  Post(
      {this.content,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.user,
      this.category});

  Post.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    user = json['user'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['content'] = content;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image'] = image;
    data['user'] = user;
    data['category'] = category;
    return data;
  }
}
