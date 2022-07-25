import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yugi_oh_cards/commons/password_input.dart';
import 'package:yugi_oh_cards/commons/text_input.dart';

class SignUpView extends StatelessWidget {
   SignUpView({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
final TextEditingController _password = TextEditingController();
final TextEditingController _reEnterPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextInputWidget(text: "Enter your name",controller: _emailController,),
        TextInputWidget(text: "Enter your email",controller: _name,),
        TextInputWidget(text: "Enter your phoneNumber",controller: _phone,),
        PassWordWidget(hintText: 'enter your password',passwordController: _password,),
        PassWordWidget(hintText: 're enter your password',passwordController: _reEnterPassword),
        ElevatedButton(onPressed: (){}, child: Text(tr("submit"))),
      ],
    );
  }
}
