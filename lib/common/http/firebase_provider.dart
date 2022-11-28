import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseProvider {
  FirebaseAuth auth() {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    return _firebaseAuth;
  }

  CollectionReference getData(
    String collectionName,
  ) {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return _firestore.collection(collectionName);
  }
}
