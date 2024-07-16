import 'package:flutter/material.dart';

Widget bodyContent(String image, String title, String body) {
  return Container(
    padding: EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 100),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image, height: 300),
              SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                body,
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
