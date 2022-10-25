import 'package:firebase_auth/firebase_auth.dart';

class RegisterContoller {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> register(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      userCredential.user!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Weak Password');
      } else if (e.code == 'email-already-in-use') {
        print('Weak Password');
      }
    }
  }
}
