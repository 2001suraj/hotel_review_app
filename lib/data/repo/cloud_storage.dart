import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CloudStorages {
  FirebaseFirestore storage = FirebaseFirestore.instance;
  Future userinfo_update({
    required String name,
    required String email,
  }) async {
    var user = await storage.collection('user').doc(email);
    await user.set({
      'name': name,
      'email': email,
    });
  }
}
