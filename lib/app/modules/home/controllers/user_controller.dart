import 'package:farmer_app/app/core/utils/helper.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  late final _userName = getAuth().currentUser!.displayName!.obs;
  String get userName => this._userName.value;
  set userName(value) => this._userName.value = value;

  final _profilePicture = getAuth().currentUser!.photoURL.obs;
  String? get profilePicture => this._profilePicture.value;
  set profilePicture(value) => this._profilePicture.value = value;

  void changeDp(String url) {
    profilePicture = url;
  }

  void changeName(String name) {
    userName = name;
  }
}
