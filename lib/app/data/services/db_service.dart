import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/app/core/values/db_strings.dart';
import 'package:farmer_app/app/data/models/post_model.dart';
import 'package:farmer_app/app/data/models/profile_model.dart';
import 'package:get/get.dart';

class DatabaseService extends GetxService {
  late FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseFirestore get instance => this._firebaseFirestore;

  Future<Profile> getProfile(String userId) async {
    var data = await instance.collection(Db.profileCol).doc(userId).get();
    if (data.data() != null) {
      return Profile.fromJson(data.data()!);
    } else {
      throw Exception("No User Data Found");
    }
  }

  Future<List<String>> getCategories() async {
    var data = await instance.collection(Db.catCol).get();
    if (data.docs.isEmpty) {
      return List.empty();
    }
    return (data.docs[0].data()[Db.catField] as List).cast<String>();
  }

  Future<void> createProfile(String uid) async {
    await instance.collection(Db.profileCol).doc(uid).set(Profile().toJson());
    return;
  }

  Future<void> updateProfile(String uid, Profile profile) async {
    await instance.collection(Db.profileCol).doc(uid).update(profile.toJson());
    return;
  }

  Future<void> createPost(Post post) async {
    await instance.collection(Db.postCol).add(post.toJson());
    return;
  }

  Future<String> getWeatherKey() async {
    final doc = await instance.collection(Db.keysCol).doc(Db.weatherDoc).get();
    final data = doc.data();
    if (!doc.exists) throw Exception("Key Not Found");
    if (data == null) throw Exception("Key Not Found");
    if ((data[Db.keyField] as String).isEmpty) throw Exception("Key Not Found");
    return data[Db.keyField];
  }

  Future<QuerySnapshot> getPosts({
    int? count,
    DocumentSnapshot? startAfter,
    String? uid,
    String? category,
  }) async {
    final query = instance.collection(Db.postCol).orderBy(Db.postTimeField);
    if (uid != null) query.where(Db.postUserField, isEqualTo: uid);
    if (category != null) query.where(Db.postCatField, isEqualTo: category);
    if (startAfter != null) query.startAfterDocument(startAfter);
    if (count != null) query.limit(count);
    return await query.get();
  }
}
