import 'package:flutter/material.dart';

class NoReminders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
        child: Image.asset(
          'assets/images/no_reminders.png',
          fit: BoxFit.cover,
          height: 230,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      const Text(
        'No reminders registered so far',
        style: TextStyle(color: Colors.grey, fontSize: 14),
      )
    ]);
  }
}
