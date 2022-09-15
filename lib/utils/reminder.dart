import 'package:flutter/material.dart';

String createFakeId() {
  return DateTime.now().toString();
}

TimeOfDay dateTimeToTime(DateTime dateTime) {
  return TimeOfDay.fromDateTime(dateTime);
}
