import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/reminder.dart';
import '../screens/edit_reminder_screen.dart';
import '../theme/colors.dart';

class ReminderCard extends StatelessWidget {
  final Reminder reminder;

  const ReminderCard(this.reminder, {Key? key}) : super(key: key);

  void selectReminder(BuildContext context) {
    Navigator.pushNamed(context, EditReminderScreen.routeName,
        arguments: reminder);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectReminder(context),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        shadowColor: shadowColor.withOpacity(0.5),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 100,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 70,
                        width: 8,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: reminder.color,
                          borderRadius: BorderRadius.circular(10),
                        ))
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reminder.title,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        reminder.description,
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                const VerticalDivider(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.access_time_outlined,
                      size: 24,
                    ),
                    Text(
                      DateFormat.Hm().format(reminder.dateTime),
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
