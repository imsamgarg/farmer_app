import 'package:cloud_firestore/cloud_firestore.dart';

class Like {
  Timestamp? createdAt;
  String? user;

  Like({this.createdAt, this.user});

  Like.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['added_at'] = createdAt;
    data['user'] = user;
    return data;
  }
}
