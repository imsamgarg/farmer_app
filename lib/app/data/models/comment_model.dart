import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  Timestamp? createdAt;
  String? text;
  String? user;

  Comment({this.createdAt, this.text, this.user});

  Comment.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    text = json['text'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['created_at'] = createdAt;
    data['text'] = text;
    data['user'] = user;
    return data;
  }
}
