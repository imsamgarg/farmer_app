import 'dart:io';

import 'package:farmer_app/app/core/values/strings.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;

class StorageService extends GetxService {
  FirebaseStorage _storage = FirebaseStorage.instance;

  Reference get storage => _storage.ref();

  Future<String> saveProfileImage(String path, String uid) async {
    final ext = p.extension(path);
    final ref = storage.child(profileRef).child("$uid$ext");
    final res = await ref.putFile(File(path));
    return await res.ref.getDownloadURL();
  }
}
