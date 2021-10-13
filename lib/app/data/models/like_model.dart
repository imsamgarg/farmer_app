class Like {
  int? addedAt;
  String? user;

  Like({this.addedAt, this.user});

  Like.fromJson(Map<String, dynamic> json) {
    addedAt = json['added_at'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['added_at'] = addedAt;
    data['user'] = user;
    return data;
  }
}
