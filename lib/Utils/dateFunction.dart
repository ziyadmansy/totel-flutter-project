import 'package:flutter/material.dart';

String getMonth(DateTime dateTime) {
  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  return months[dateTime.month - 1];
}

String WeekDayName(DateTime dateTime) {
  List<String> months = ['', 'Mon', 'Tue', 'Wed', 'Thurs', 'Fri', 'Sat', 'Sun'];
  return months[dateTime.weekday];
}

String getFullDate(DateTime selectedDate) {
  return getMonth(selectedDate) +
      " " +
      selectedDate.day.toString() +
      ", " +
      selectedDate.year.toString() +
      " " +
      WeekDayName(selectedDate);
}
