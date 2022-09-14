import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../theme/colors.dart';
import '../theme/box_decoration.dart';
import '../utils/calendar_utils.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration.calendar,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TableCalendar(
            headerStyle: HeaderStyle(
                headerMargin: const EdgeInsets.only(bottom: 20),
                leftChevronIcon: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
                rightChevronIcon: const Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
                titleCentered: true,
                titleTextFormatter: (date, locale) =>
                    DateFormat.yMMMM().format(date),
                titleTextStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                formatButtonVisible: false),
            calendarStyle: const CalendarStyle(
                outsideDaysVisible: false,
                defaultTextStyle: TextStyle(color: Colors.white),
                holidayTextStyle: TextStyle(color: Colors.white),
                isTodayHighlighted: false,
                selectedDecoration: AppBoxDecoration.calendarDay,
                weekendTextStyle: TextStyle(color: Colors.white)),
            daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.white),
                weekendStyle: TextStyle(color: Colors.white)),
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            calendarFormat: CalendarFormat.month,
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, day, events) {
                //if we have reminders in this day return the follow container, if not, return null
                return Container(
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 30, left: 20),
                  decoration: const BoxDecoration(
                      color: markerColor, shape: BoxShape.circle),
                );
              },
            ),
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
            margin: const EdgeInsets.only(top: 30),
            child: const Center(
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
