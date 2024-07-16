import 'package:flutter/material.dart';

import '../customTextFormField.dart';
import '../formLabelWidget.dart';

Widget nameFields() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FormLabelWidget(label: 'الاسم الاخير'),
            SizedBox(height: 8),
            CustomTextFormField(
              hintText: 'ادخل اسمك الاخير هنا',
              controller: TextEditingController(),
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return 'ادخل اسمك';
                }
                return null;
              },
              type: TextInputType.name,
            ),
          ],
        ),
      ),
      SizedBox(width: 25),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FormLabelWidget(label: 'الاسم الأول'),
            SizedBox(height: 8),
            CustomTextFormField(
              hintText: 'ادخل اسمك الاول هنا',
              controller: TextEditingController(),
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return 'ادخل اسمك';
                }
                return null;
              },
              type: TextInputType.name,
            ),
          ],
        ),
      ),
    ],
  );
}
Widget emailField(TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      FormLabelWidget(label: 'البريد الالكتروني'),
      SizedBox(height: 8),
      CustomTextFormField(
        hintText: 'ادخل البريد الالكتروني هنا',
        controller: controller,
        validator: (text) {
          if (text == null || text.trim().isEmpty) {
            return 'ادخل البريد الالكتروني';
          }
          var emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(text);
          if (!emailValid) {
            return 'البريد الالكتروني غير صحيح';
          }
          return null;
        },
        type: TextInputType.emailAddress,
      ),
    ],
  );
}Widget phoneField() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      FormLabelWidget(label: 'رقم الهاتف'),
      SizedBox(height: 8),
      CustomTextFormField(
        hintText: 'ادخل رقم الهاتف هنا',
        controller: TextEditingController(),
        validator: (text) {
          if (text == null || text.trim().isEmpty) {
            return 'ادخل رقم الهاتف';
          }
          if (text.length < 11) {
            return 'رقم الهاتف غير صحيح';
          }
          return null;
        },
        type: TextInputType.phone,
      ),
    ],
  );
}
