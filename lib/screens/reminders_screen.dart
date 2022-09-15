import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/reminders.dart';
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
  DateTime _selectedDate = DateTime.now();
  void _openCalendar(BuildContext buildContext) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: buildContext,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: Calendar(
                selectedDate: _selectedDate,
                onSelectedDateChanged: (DateTime selectedDate) {
                  setState(() {
                    _selectedDate = selectedDate;
                  });
                }),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final reminders = Provider.of<Reminders>(context,
            listen:
                true //this has true as default and we can use false when we do not need to rebuild the widget when something changes in the provider
            )
        .remindersByDate(_selectedDate);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(_selectedDate),
            reminders.isEmpty
                ? NoReminders()
                : Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: ListView.builder(
                        itemCount: reminders.length,
                        itemBuilder: ((context, index) =>
                            ReminderCard(reminders[index])),
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
