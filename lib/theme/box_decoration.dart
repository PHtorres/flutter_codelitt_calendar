import 'package:flutter/material.dart';

import '../constants/app.dart';
import 'colors.dart';

class AppBoxDecoration {
  static BoxDecoration calendar = BoxDecoration(
      borderRadius: isDesktop
          ? const BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))
          : const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      gradient: const LinearGradient(
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
