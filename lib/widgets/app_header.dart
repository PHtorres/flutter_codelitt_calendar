import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../screens/add_reminder_screen.dart';
import '../constants/date.dart';
import '../theme/box_decoration.dart';

class AppHeader extends StatelessWidget {
  final date;
  const AppHeader(this.date, {Key? key}) : super(key: key);

  void _goToAddReminder(BuildContext context) {
    Navigator.pushNamed(context, AddReminderScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat.yMMMMEEEEd().format(date),
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
