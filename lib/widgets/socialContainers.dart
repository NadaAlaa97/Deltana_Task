import 'package:deltana_task/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class SocialMediaContainers extends StatelessWidget {
  final String text;
  final String textTwo;
  final VoidCallback onTap;

  SocialMediaContainers({
    required this.text,
    required this.textTwo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 60,
              width: 90,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Brand(Brands.facebook_f),
              ),
            ),
            Container(
              width: 90,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey),
              ),
              child: IconButton(onPressed: () {}, icon: Brand(Brands.google)),
            ),
            Container(
              width: 90,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey),
              ),
              child: IconButton(onPressed: () {}, icon: Brand(Brands.apple_logo)),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: onTap,
              child: Text(
                textTwo,
                style: TextStyle(color: MyTheme.myYellow, fontSize: 20),
              ),
            ),
            SizedBox(width: 7),
            Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }
}
