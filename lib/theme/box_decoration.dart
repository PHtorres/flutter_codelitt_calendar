import 'package:flutter/material.dart';

import 'colors.dart';

class AppBoxDecoration {
  static const BoxDecoration calendar = BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      gradient: LinearGradient(
          colors: [startPrimaryColor, endPrimaryColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter));

  static BoxDecoration button = BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      gradient: const LinearGradient(
          colors: [startSecondaryColor, endSecondaryColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight));

  static const BoxDecoration calendarDay = BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
          colors: [startSecondaryColor, endSecondaryColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight));
}
