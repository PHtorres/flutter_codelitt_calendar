import 'package:flutter/material.dart';
import '../theme/box_decoration.dart';
import 'package:intl/intl.dart';

class AppHeader extends StatelessWidget {
  final todayText = DateFormat.yMMMMEEEEd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              todayText,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.all(12),
                child: Text(
                  'Add reminder',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                decoration: AppBoxDecoration.secondary,
              ),
            )
          ],
        ));
  }
}
