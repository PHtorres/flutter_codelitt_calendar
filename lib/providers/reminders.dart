import 'package:flutter/foundation.dart';
import 'package:table_calendar/table_calendar.dart';
import '../data/reminders.dart';

import '../models/reminder.dart';

class Reminders with ChangeNotifier {
  List<Reminder> _items = DUMMY_REMINDERS;
  DateTime _selectedDate = DateTime.now();

  List<Reminder> get items {
    return [..._items];
  }

  DateTime get selectedDate {
    return _selectedDate;
  }

  List<Reminder> remindersBySelectedDate() {
    _items.sort(((a, b) => a.dateTime.compareTo(b.dateTime)));
    print(selectedDate);
    return _items
        .where((item) => isSameDay(item.dateTime, _selectedDate))
        .toList();
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void addReminder(Reminder reminder) {
    _items.add(reminder);
    notifyListeners();
  }

  void editReminder(Reminder reminder) {
    _items[_items.indexWhere((item) => item.id == reminder.id)] = reminder;
    notifyListeners();
  }

  void removeReminder(String reminderId) {
    _items.removeWhere((item) => item.id == reminderId);
    notifyListeners();
  }
}
