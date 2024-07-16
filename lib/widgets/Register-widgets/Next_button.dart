import 'package:flutter/material.dart';
import 'package:deltana_task/utils/my_theme.dart';
import 'package:deltana_task/presentation/Authentication/Register/password-screen.dart';

Widget nextButton(BuildContext context,GlobalKey<FormState> formKey) {
  return Container(
    width: double.infinity,
    child: FloatingActionButton(
      onPressed: () {
    if (formKey.currentState?.validate() == true) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PasswordScreen()),
      );
    }
      },
      backgroundColor: MyTheme.myYellow,
      child: Text(
        'التالي',
        style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
