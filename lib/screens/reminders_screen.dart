import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app.dart';
import '../providers/reminders.dart';
import '../widgets/calendar.dart';
import '../widgets/app_header.dart';
import '../widgets/no_reminders.dart';
import '../widgets/reminder_card.dart';

class RemindersScreen extends StatelessWidget {
  static const routeName = 'reminders';

  void _openCalendar(BuildContext buildContext) {
    final reminders = Provider.of<Reminders>(buildContext, listen: false);
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: buildContext,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: Calendar(
                selectedDate: reminders.selectedDate,
                onSelectedDateChanged: reminders.setSelectedDate),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final reminders = Provider.of<Reminders>(context,
        listen:
            true //this has true as default and we can use false when we do not need to rebuild the widget when something changes in the provider
        );
    final remindersItems = reminders.remindersBySelectedDate();
    final selectedDate = reminders.selectedDate;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(selectedDate),
            remindersItems.isEmpty
                ? NoReminders()
                : Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: ListView.builder(
                        itemCount: remindersItems.length,
                        itemBuilder: ((context, index) =>
                            ReminderCard(remindersItems[index])),
                      ),
                    ),
                  )
          ],
        ),
      ),
      floatingActionButton: !isDesktop
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () => _openCalendar(context),
              child: const Icon(
                Icons.calendar_month,
              ),
            )
          : null,
    );
  }
}
