import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final _instance = FirebaseAuth.instance;

  Future<User?> emailSignIn(String email, String password) async {
    final UserCredential userCredential = await _instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }
}
