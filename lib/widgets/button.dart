import 'package:flutter/material.dart';

import '../theme/colors.dart';

enum ButtonType { primary, cancel, danger }

class Button extends StatelessWidget {
  final String title;
  final Function onPressed;
  ButtonType? type = ButtonType.primary;
  Button({Key? key, required this.title, required this.onPressed, this.type})
      : super(key: key);

  Color get buttonColor {
    switch (type) {
      case ButtonType.cancel:
        return cancelColor;
      case ButtonType.danger:
        return dangerColor;
      default:
        return primaryColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      onPressed: () => onPressed(),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
