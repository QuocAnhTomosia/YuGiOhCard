import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yugi_oh_cards/commons/password_input.dart';
import 'package:yugi_oh_cards/commons/text_input.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login "),
      ),
      body: Column(
        children: <Widget>[
          TextInputWidget(
            text: "Enter your email",
            controller: _emailController,
          ),
          PassWordWidget(
            hintText: "Enter your password",passwordController: _passwordController,
          ),
          ElevatedButton(onPressed: () async {
            try {
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _emailController.text,
    password: _passwordController.text,
  );
  Navigator.of(context).pushNamedAndRemoveUntil(
              '/home_page', (Route<dynamic> route) => false);
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    
  } else if (e.code == 'wrong-password') {
    
  }
}
          }, child: Text(tr("submit"))),
        ],
      ),
    );
  }
}
