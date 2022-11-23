import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  
  Future<void> getGamesStatus() async {
    var data =  _firebaseFirestore.collection("games").snapshots();
    data.map((event) {
      event;
      print(event);
    });
    
        
  //   try {
  //     _firebaseFirestore.collection("games").snapshots().map((snapshot){
  //       snapshot;
  //       print(snapshot);
  //     });
  //   } on FirebaseException catch (e) {
  //     print(e.toString());
  //   }
  // }

  
}}