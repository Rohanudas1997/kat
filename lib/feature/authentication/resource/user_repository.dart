import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:kat_game/common/http/firebase_provider.dart';
import 'package:kat_game/common/http/response.dart';

class UserRepository {
  const UserRepository({
    required this.firebaseProvider,
  });
  final FirebaseProvider firebaseProvider;
  static ValueNotifier<User?> _user = ValueNotifier(null);
  static ValueNotifier<bool> _isLoggedIn = ValueNotifier(false);
  ValueNotifier<User?> get user => _user;
  ValueNotifier<bool> get isLoggedIn => _isLoggedIn;

  Future initialState() async {
    final _loggedUser = firebaseProvider.auth().currentUser;
    if (_loggedUser != null) {
      _user.value = _loggedUser;
      _isLoggedIn.value = true;
    }
  }

  Future<bool> logout() async {
    try {
      final _loggedUser = firebaseProvider.auth().currentUser;
      if (_loggedUser != null) {
        firebaseProvider.auth().signOut();
        _isLoggedIn.value = false;
        _user.value = null;
        return true;
      }
    } on FirebaseAuthException catch (_) {
      print("Error has occured");
    }
    return false;
  }

  Future<DataResponse<bool>> registerWithEmail({
    required String email,
    required String name,
    required String samId,
    required String password,
  }) async {
    try {
      firebaseProvider.auth().createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
      return DataResponse.success(true);
    } on FirebaseAuthException catch (e) {
      return DataResponse.error(e.message);
    } catch (e) {
      return DataResponse.error(e.toString());
    }
  }

  Future<DataResponse<User>> login({
    required String email,
    required String password,
  }) async {
    try {
      firebaseProvider.auth().signOut();
      UserCredential userCredential = await firebaseProvider
          .auth()
          .signInWithEmailAndPassword(email: email, password: password);
      _user.value = userCredential.user;
      _isLoggedIn.value = true;
      return DataResponse.success(_user.value);
    } on FirebaseAuthException catch (e) {
      return DataResponse.error(e.message);
    } catch (e) {
      return DataResponse.error(e.toString());
    }
  }
}
