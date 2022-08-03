import 'package:firebase_auth/firebase_auth.dart';
import 'package:yugi_oh_cards/services/firebase_firestore_service.dart';

class FirebaseAuthService {
  final _instance = FirebaseAuth.instance;
  signOut() async {
    await _instance.signOut();
  }

  Future<String> emailSignIn(String email, String password) async {
    try {
      final UserCredential userCredential = await _instance
          .signInWithEmailAndPassword(email: email, password: password);

      return await FireStoreService().getUser(email);
    } on FirebaseAuthException catch (err) {
      return err.code;
    } catch (e) {
      return "some error happend";
    }
  }
}
