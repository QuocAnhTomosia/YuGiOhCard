import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireStoreService {
  // instance de mo firestore
  //ref de mo image storage
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  final FirebaseStorage _ref = FirebaseStorage.instance;

  addNewUser(String email, String name, String imageLink) {
    
    _instance
        .collection("User")
        .add({"email": email, "name": name, "image_link": imageLink});
  }
}
