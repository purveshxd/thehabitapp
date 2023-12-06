// dateFormatter
import 'package:intl/intl.dart';

String dateFormatter(DateTime date) {
  // final date = DateTime.now();
  final formattedDate = DateFormat('dd-E').format(date);

  return formattedDate;
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
