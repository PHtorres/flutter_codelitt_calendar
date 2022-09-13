import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../theme/box_decoration.dart';
import '../utils/calendar_utils.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration.calendar,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TableCalendar(
            // calendarStyle: CalendarStyle(
            //     defaultDecoration: AppBoxDecoration.primary,
            //     outsideDecoration: AppBoxDecoration.primary),
            headerStyle: HeaderStyle(
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
                titleCentered: true,
                titleTextFormatter: (date, locale) =>
                    DateFormat.yMMMM().format(date),
                titleTextStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                formatButtonVisible: false),
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            calendarFormat: CalendarFormat.month,
            selectedDayPredicate: (day) {
              // Use `selectedDayPredicate` to determine which day is currently selected.
              // If this returns true, then `day` will be marked as selected.

              // Using `isSameDay` is recommended to disregard
              // the time-part of compared DateTime objects.
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                // Call `setState()` when updating the selected day
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
          ),
          Container(
            height: 100,
            child: Center(
              child: Text(
                '© 2022 Codelitt Inc All rights reserved',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
