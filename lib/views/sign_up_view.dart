import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yugi_oh_cards/commons/password_input.dart';
import 'package:yugi_oh_cards/commons/text_input.dart';
import 'dart:async';
import 'dart:io';

class AvatarPicker extends StatefulWidget {
  const AvatarPicker({Key? key}) : super(key: key);

  @override
  State<AvatarPicker> createState() => _AvatarPickerState();
}

class _AvatarPickerState extends State<AvatarPicker> {
  XFile? imageFile;
  //imageError de xu ly error
  dynamic _pickImageError;
  _getFromGallery() async {
    try {
      final imagePicker =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        imageFile = imagePicker;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: InkWell(
        onTap: _getFromGallery,
        child: imageFile != null
            ? Image.file(
                fit: BoxFit.cover,
                File(imageFile!.path),
                height: 150.0,
                width: 100.0,
              )
            : Image.network(
                'https://media.istockphoto.com/photos/obedient-dog-breed-welsh-corgi-pembroke-sitting-and-smiles-on-a-white-picture-id1193591781?k=20&m=1193591781&s=612x612&w=0&h=D2Qg6u_zxR0BlaV_JnBUPk69s1fKA8jLWXqKL307L7A='),
      ),
    );
  }
}


class SignUpView extends StatelessWidget {
  SignUpView({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _reEnterPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          const AvatarPicker(),
          TextInputWidget(
            text: "Enter your name",
            controller: _emailController,
          ),
          TextInputWidget(
            text: "Enter your email",
            controller: _name,
          ),
          TextInputWidget(
            text: "Enter your phoneNumber",
            controller: _phone,
          ),
          PassWordWidget(
            hintText: 'enter your password',
            passwordController: _password,
          ),
          PassWordWidget(
              hintText: 're enter your password',
              passwordController: _reEnterPassword),
          ElevatedButton(onPressed: () {}, child: Text(tr("submit"))),
        ],
      ),
    );
  }
}
