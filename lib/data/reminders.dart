import '../constants/reminder_colors.dart';
import '../models/reminder.dart';

final DUMMY_REMINDERS = [
  Reminder(
      id: 'reminder-1',
      title: 'Go to school',
      description: 'Dance class',
      dateTime: DateTime(2022, 9, 23, 16, 30),
      color: reminderColors[0]),
  Reminder(
      id: 'reminder-2',
      title: 'Wash car and bike',
      description: 'Try to save water',
      dateTime: DateTime(2022, 9, 24, 12, 00),
      color: reminderColors[1]),
  Reminder(
      id: 'reminder-3',
      title: 'Go to gym',
      description: 'Take new shoes',
      dateTime: DateTime(2022, 9, 25, 10, 30),
      color: reminderColors[2]),
  Reminder(
      id: 'reminder-4',
      title: 'Call mom to wish happy birthday',
      description: 'Ask about family',
      dateTime: DateTime(2022, 9, 27, 8, 30),
      color: reminderColors[3]),
  Reminder(
      id: 'reminder-5',
      title: 'Clean my desk',
      description: 'Check if chair needs this',
      dateTime: DateTime(2022, 9, 30, 18, 45),
      color: reminderColors[4]),
];
