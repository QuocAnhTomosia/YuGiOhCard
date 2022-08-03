import 'package:flutter/material.dart';


class SignUpDialog extends StatelessWidget {
  final String error;
  const SignUpDialog(
     {
    Key? key, required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("please check our Sign up "),
      content:  Text(error),
      actions: [
        TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
      ],
    );
  }
}
