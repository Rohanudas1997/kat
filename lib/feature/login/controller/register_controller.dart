import 'package:firebase_auth/firebase_auth.dart';

class RegisterContoller {
  Future<void> register(String email, String password) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    userCredential.user?.sendEmailVerification();
    //userCredential.user!.sendEmailVerification();
  }
}
