import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/reminder.dart';
import '../providers/reminders.dart';
import '../widgets/reminder_form.dart';

class EditReminderScreen extends StatelessWidget {
  static const routeName = 'edit-reminder';
  const EditReminderScreen({Key? key}) : super(key: key);

  //Reminder reminder;

  void _editReminder(
      BuildContext context,
      String? id,
      String title,
      String description,
      DateTime selectedDate,
      TimeOfDay selectedTime,
      Color selectedColor) {
    var processingEditReminder = ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Editing reminder...')),
    );
    final dateAndTime = DateTime(selectedDate.year, selectedDate.month,
        selectedDate.day, selectedTime.hour, selectedTime.minute);
    final reminder = Reminder(
        id: id!,
        title: title,
        description: description,
        dateTime: dateAndTime,
        color: selectedColor);
    Provider.of<Reminders>(context, listen: false).editReminder(reminder);
    processingEditReminder.close();
    Navigator.pop(context);
  }

  void _cancel(BuildContext context) {
    Navigator.pop(context);
  }

  void _removeReminder(BuildContext context, String reminderId) {
    var processingRemoveReminder = ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Removing reminder...')),
    );
    Provider.of<Reminders>(context, listen: false).removeReminder(reminderId);
    processingRemoveReminder.close();
    Navigator.pop(context);
  }

  Widget _buildHeader(Reminder reminder) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      child: Text(
        'Edit reminder - ${DateFormat.yMMMMEEEEd().format(reminder.dateTime)}',
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final reminderArg = ModalRoute.of(context)?.settings.arguments as Reminder;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              _buildHeader(reminderArg),
              ReminderForm(
                  initialDataForm: reminderArg,
                  onSave: _editReminder,
                  onCancel: _cancel,
                  onRemove: _removeReminder),
            ],
          ),
        ),
      ),
    );
  }
}
