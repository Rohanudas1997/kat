import 'package:firebase_auth/firebase_auth.dart';

class ResetController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> reset(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
