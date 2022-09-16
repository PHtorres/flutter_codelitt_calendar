import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../constants/app.dart';
import '../providers/reminders.dart';
import '../theme/colors.dart';
import '../theme/box_decoration.dart';
import '../utils/calendar_utils.dart';

class Calendar extends StatelessWidget {
  final Function onSelectedDateChanged;
  final DateTime selectedDate;
  Calendar(
      {Key? key,
      required this.onSelectedDateChanged,
      required this.selectedDate})
      : super(key: key);
  DateTime _focusedDay = DateTime.now();
  //DateTime? _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final allReminders = Provider.of<Reminders>(context).items;
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
                if (allReminders.any((item) => isSameDay(item.dateTime, day))) {
                  return Container(
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 30, left: 20),
                    decoration: const BoxDecoration(
                        color: markerColor, shape: BoxShape.circle),
                  );
                }
              },
            ),
            selectedDayPredicate: (day) {
              return isSameDay(selectedDate, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(selectedDate, selectedDay)) {
                onSelectedDateChanged(selectedDay);
                if(!isDesktop) Navigator.pop(context);
              }
            },
            onPageChanged: (focusedDay) {
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
