import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  late FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> isSigned() async {
    final user = _firebaseAuth.currentUser;
    return user != null;
  }

  Future<void> changeName(String name) async {
    await _firebaseAuth.currentUser?.updateDisplayName(name);
  }

  Future<void> changeDp(String url) async {
    await _firebaseAuth.currentUser?.updatePhotoURL(url);
  }

  FirebaseAuth get auth => _firebaseAuth;
}
