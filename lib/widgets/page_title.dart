import 'package:flutter/material.dart';

import '../constants/app.dart';

double fontSize = isDesktop ? 20 : 16;

class PageTitle extends StatelessWidget {
  final String title;
  const PageTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
      ),
    );
  }
}
