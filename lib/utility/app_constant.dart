import 'package:flutter/material.dart';

class AppConstant {
  // field
  static String appName = "Cat project";
  static Color bgColor = Colors.orange;

  //method it's group

  BoxDecoration basicBox() {
    return BoxDecoration(
      color: bgColor,
    );
  }

  BoxDecoration linearBox() {
    return BoxDecoration(
      gradient: LinearGradient(
          colors: [Colors.white, bgColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
    );
  }

  BoxDecoration radioBox() {
    return BoxDecoration(
        gradient: RadialGradient(
            colors: [Colors.white, bgColor],
            radius: 1.0,
            center: Alignment(-0.5, -0.5)));
  }

  TextStyle h1Style({double? fontSize}) {
    return TextStyle(fontSize: fontSize ?? 48, fontWeight: FontWeight.bold);
  }

  TextStyle h2Style() {
    return TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
  }

  TextStyle h3Style() {
    return TextStyle(fontSize: 14, fontWeight: FontWeight.normal);
  }
}
