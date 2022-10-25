import 'package:firebase_auth/firebase_auth.dart';

class LoginController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> loign(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('User not signed up.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password');
      }
    }
  }
}
