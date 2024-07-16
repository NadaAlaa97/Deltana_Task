import 'package:flutter/material.dart';

class FormLabelWidget extends StatelessWidget {
String label;
FormLabelWidget({required this.label});
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 22
      ),
    );
  }
}
