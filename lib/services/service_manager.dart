import 'package:cloud_firestore/cloud_firestore.dart';
import '../_lib.dart';
import '../models/user_model.dart';
import '../models/post_model.dart';
final firestoreServiceProvider = Provider<FirestoreService>((ref) {
  return FirestoreService();
});
class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<UserModel>> getUsers() async {
    final snapshot = await _firestore.collection('users').get();
    return snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).toList();
  }

  Future<List<PostModel>> getPosts() async {
    final snapshot = await _firestore.collection('post').get();
    return snapshot.docs.map((doc) => PostModel.fromMap(doc.data())).toList();
  }
}