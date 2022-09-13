import 'package:flutter/material.dart';
import '../widgets/calendar.dart';
import '../widgets/app_header.dart';
import '../widgets/no_reminders.dart';

class RemindersScreen extends StatefulWidget {
  static const routeName = 'reminders';
  @override
  State<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {

  void _openCalendar(BuildContext buildContext) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
        context: buildContext,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: Calendar(),
            behavior: HitTestBehavior.opaque,
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [AppHeader(), NoReminders()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openCalendar(context),
        child: Icon(Icons.calendar_month),
      ),
    );
  }
}
