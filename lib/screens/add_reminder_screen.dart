import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/date.dart';
import '../models/reminder.dart';
import '../providers/reminders.dart';
import '../utils/reminder.dart';
import '../widgets/reminder_form.dart';

class AddReminderScreen extends StatelessWidget {
  static const routeName = 'add-reminder';
  const AddReminderScreen({Key? key}) : super(key: key);
  void _cancel(BuildContext context) {
    Navigator.pop(context);
  }

  void _saveReminder(
      BuildContext context,
      String? id,
      String title,
      String description,
      DateTime selectedDate,
      TimeOfDay selectedTime,
      Color selectedColor) {
    var processingAddReminder = ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Adding reminder...')),
    );
    final dateAndTime = DateTime(selectedDate.year, selectedDate.month,
        selectedDate.day, selectedTime.hour, selectedTime.minute);
    final reminder = Reminder(
        id: createFakeId(),
        title: title,
        description: description,
        dateTime: dateAndTime,
        color: selectedColor);
    Provider.of<Reminders>(context, listen: false).addReminder(reminder);
    processingAddReminder.close();
    Navigator.pop(context);
  }

  Widget _buildHeader() {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      child: Text(
        'Add reminder - $todayText',
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              _buildHeader(),
              ReminderForm(onSave: _saveReminder, onCancel: _cancel),
            ],
          ),
        ),
      ),
    );
  }
}
