import 'package:flutter/material.dart';
import '../data/reminders.dart';
import '../widgets/calendar.dart';
import '../widgets/app_header.dart';
import '../widgets/no_reminders.dart';
import '../widgets/reminder_card.dart';

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

  bool get _noReminders {
    return DUMMY_REMINDERS.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(),
            _noReminders
                ? NoReminders()
                : Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: ListView.builder(
                        itemCount: DUMMY_REMINDERS.length,
                        itemBuilder: ((context, index) =>
                            ReminderCard(DUMMY_REMINDERS[index])),
                      ),
                    ),
                  )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => _openCalendar(context),
        child: const Icon(
          Icons.calendar_month,
        ),
      ),
    );
  }
}
