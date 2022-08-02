import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yugi_oh_cards/bloc/sign_up/bloc/user_sign_up_bloc.dart';
import 'package:yugi_oh_cards/commons/constant.dart';
import 'package:yugi_oh_cards/commons/password_input.dart';
import 'package:yugi_oh_cards/commons/text_input.dart';
import 'dart:async';
import 'dart:io';

import 'package:yugi_oh_cards/cubit/image_cubit.dart';

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
      // ignore: use_build_context_synchronously, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
      context.read<ImageCubit>().emit(File(imagePicker!.path));
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
    return Column(
      children: [
        CircleAvatar(
          radius: 50, // Image radius
          backgroundImage: imageFile != null
              ? FileImage(
                  File(imageFile!.path),
                ) as ImageProvider
              : AssetImage(Constant().avatarImage),
        ),
        ElevatedButton(
            onPressed: _getFromGallery,
            child: const Text("Choose your Avatar")),
      ],
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            AvatarPicker(),
            TextInputWidget(
              text: "Enter your name",
              controller: _name,
            ),
            TextInputWidget(
              text: "Enter your email",
              controller: _emailController,
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
            BlocListener<UserSignUpBloc, UserSignUpState>(
              child: ElevatedButton(
                onPressed: (() {
                  context.read<UserSignUpBloc>().add(UserSignUpSubmit(
                      name: _name.text,
                      email: _emailController.text,
                      password: _password.text,
                      phoneNumber: _phone.text,
                      image: File(context.read<ImageCubit>().state.path)));
                  
                }),
                child: Text(tr("submit")),
              ),
              listener: (context, state) {
                if (state is UserSignUpSubmitted) {
                  Navigator.pushNamed(context, '/log_in');
                }
                if (state is UserSignUpError) {
                  showDialog(
                      context: context,
                      builder: ((context) => AlertDialog(
                            title: const Text("please check Sign up Info"),
                            content: Text(state.error),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                            ],
                          )));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
