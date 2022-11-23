import 'package:firebase_auth/firebase_auth.dart';

class RegisterContoller {
  Future<void> register(String email, String password) async {
    try{
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

      //userCredential.user?.sendEmailVerification();
    }catch(e){
      print(e.toString());
    }
    
    
    //userCredential.user!.sendEmailVerification();
  }
}
