import 'package:flutter/material.dart';

class AppBoxDecoration {
  static const BoxDecoration calendar = BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      gradient: LinearGradient(colors: [
        Color.fromRGBO(16, 18, 119, 1),
        Color.fromRGBO(66, 31, 145, 1)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter));

  static BoxDecoration secondary = BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(255, 70, 93, 1),
          Color.fromRGBO(188, 70, 186, 1)
        ],
        //begin: Alignment.centerLeft,
        //end: Alignment.centerRight
      ));
}
