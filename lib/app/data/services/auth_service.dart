import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  late FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> isSigned() async {
    final user = _firebaseAuth.currentUser;
    return user != null;
  }

  FirebaseAuth get auth => _firebaseAuth;
}
