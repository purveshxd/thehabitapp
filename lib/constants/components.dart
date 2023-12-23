// dateFormatter
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<Color> materialColors = [
  const Color(0xfff44336),
  const Color(0xffe91e63),
  const Color(0xff9c27b0),
  const Color(0xff673ab7),
  const Color(0xff3f51b5),
  const Color(0xff2196f3),
  const Color(0xff03a9f4),
  const Color(0xff00bcd4),
  const Color(0xff009688),
  const Color(0xff4caf50),
  const Color(0xff8bc34a),
  const Color(0xffcddc39),
  const Color(0xffffeb3b),
  const Color(0xffffc107),
  const Color(0xffff9800),
  const Color(0xffff5722),
  const Color(0xff795548),
  const Color(0xff607d8b)
];

String dateFormatter(DateTime date) {
  // final date = DateTime.now();
  final formattedDate = DateFormat('dd-E').format(date);
  // print(DateTime.now().day / 7);
  // print(DateTime.now().weekOfMonth);
  // print(formattedDate);
  return formattedDate;
}

String dateToStr(DateTime date) {
  // returns a datetime in year-month-day format
  // ex. 2023-12-01
  return DateFormat('y-M-dd').format(date);
}

bool isToday(DateTime date) {
  return (dateFormatter(date) ==
      dateFormatter(
        DateTime.now(),
      ));
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
