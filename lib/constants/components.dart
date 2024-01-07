// dateFormatter
import 'package:intl/intl.dart';



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
