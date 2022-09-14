import 'package:flutter/material.dart';
import '../screens/add_reminder_screen.dart';
import '../constants/date.dart';
import '../theme/box_decoration.dart';

class AppHeader extends StatelessWidget {
  void _goToAddReminder(BuildContext context) {
    Navigator.pushNamed(context, AddReminder.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              todayText,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            InkWell(
              onTap: () => _goToAddReminder(context),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: AppBoxDecoration.button,
                child: const Text(
                  'Add reminder',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            )
          ],
        ));
  }
}
