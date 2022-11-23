import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:kat_game/common/database/shared_pref.dart';
import 'package:toast/toast.dart';

class LoginController extends GetxController{
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  ValueNotifier<bool> isLogged = ValueNotifier(false);


  Future<void> login(String email, String password) async {
    try {
      _firebaseAuth.signOut();
      SharedPref pref = SharedPref();
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
          print(userCredential.user?.email ?? 'User');
          pref.saveUser(true);
          isLogged.value = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        isLogged.value = false;
      } else if (e.code == 'wrong-password') {
        isLogged.value = false;
      }
    }
  }

  Future<void> logout() async{
    _firebaseAuth.signOut();
  }
}
