import 'package:flutter/material.dart';

import 'colors.dart';

final themeData = ThemeData(
    textSelectionTheme: const TextSelectionThemeData(cursorColor: primaryColor),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
      floatingLabelStyle: TextStyle(fontSize: 16, color: primaryColor),
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
    ),
    primaryColor: primaryColor);
