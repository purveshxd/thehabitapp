// import 'dart:math';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:intl/intl.dart';

class WeeklyCalendar extends StatelessWidget {
  const WeeklyCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    // dateFormatter
    String dateFormatter(DateTime date) {
      // final date = DateTime.now();
      final formattedDate = DateFormat('dd-E').format(date);
      return formattedDate;
    }

// generates list of days in week
    List giveDateRange() {
      // year month day
      final date = DateTime(2023, 11, 1);
      final weekList = List.generate(7, (index) {
        return date.add(Duration(days: index));
      }, growable: true);
      return weekList;
    }

    bool isToday(DateTime date) {
      return (dateFormatter(date) ==
          dateFormatter(
            DateTime.now(),
          ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (var date in giveDateRange())
          GestureDetector(
            onTap: () {
              // print(dateFormatter(DateTime.now()));
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isToday(date)
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.surfaceVariant,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dateFormatter(date).split('-')[0],
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    dateFormatter(date).split('-')[1],
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          )
      ],
    );
  }
}
