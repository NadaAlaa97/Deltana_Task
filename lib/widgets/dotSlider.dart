import 'package:flutter/material.dart';

import '../utils/my_theme.dart';

Widget dotSlider(bool isActive) {
  return Container(
    margin: EdgeInsets.only(left: 4, right: 4,bottom: 70),
    width: isActive ? 35 : 8,
    height: 8,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      shape: BoxShape.rectangle,
      color: isActive ? MyTheme.myYellow : Colors.grey,
    ),
  );
}
