import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxService {
  late FirebaseAuth _auth = FirebaseAuth.instance;
  late User? user = _auth.currentUser;

  bool isUserLogged() {
    if (user == null) return false;
    return true;
  }
}
