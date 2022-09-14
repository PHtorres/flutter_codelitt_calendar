import 'package:flutter/material.dart';

class Reminder {
  final String id;
  final String title;
  final String description;
  final DateTime dateTime;
  final Color color;

  Reminder(
      {required this.id,
      required this.title,
      required this.description,
      required this.dateTime,
      required this.color});
}
