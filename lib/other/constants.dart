import 'package:flutter/material.dart';

const primaryColor = Color(0xff1B52CC);

const containerDecoration = BoxDecoration(
  color: Color(0xff1B52CC),
  borderRadius: BorderRadius.all(
    Radius.circular(00),
  ),
);

const texttaken = 'test';

BoxDecoration pageBackGround = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      primaryColor,
      primaryColor.withOpacity(
        0.3,
      ),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);
