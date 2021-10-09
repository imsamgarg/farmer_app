class Profile {
  String? about;
  String? address;
  String? name;
  String? profileImage;
  String? user;

  Profile({this.about, this.address, this.name, this.profileImage, this.user});

  Profile.fromJson(Map<String, dynamic> json) {
    about = json['about'] ?? "";
    address = json['address'] ?? "";
    name = json['name'] ?? "";
    profileImage = json['profile_image'] ?? "";
    user = json['user'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['about'] = about ?? "";
    data['address'] = address ?? "";
    data['name'] = name ?? "";
    data['profile_image'] = profileImage ?? "";
    data['user'] = user ?? "";
    return data;
  }
}
