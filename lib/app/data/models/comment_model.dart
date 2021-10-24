import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  Timestamp? createdAt;
  String? text;
  String? userId;
  String? profileImage;
  String? userName;

  Comment({
    this.createdAt,
    this.text,
    this.userId,
    this.userName,
    this.profileImage,
  });

  Comment.fromJson(dynamic json) {
    createdAt = json['created_at'];
    text = json['text'];
    userId = json['user'];
    profileImage = json['profile_image'];
    userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['created_at'] = createdAt;
    data['text'] = text;
    data['profile_image'] = profileImage;
    data['user_name'] = userName;
    data['user'] = userId;
    return data;
  }
}
