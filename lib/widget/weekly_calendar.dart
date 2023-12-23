// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habitapp/constants/components.dart';
import 'package:habitapp/constants/constants.dart';
import 'package:habitapp/controller/habit.controller.dart';
import 'package:habitapp/localStorage/local_store.dart';
import 'package:habitapp/style/style.controller.dart';

class WeeklyCalendar extends StatelessWidget {
  final dynamic habitList;
  const WeeklyCalendar({super.key, required this.habitList});

  @override
  Widget build(BuildContext context) {
// generates list of days in week
    List<DateTime> giveDateRange() {
      DateTime firstDayofWeek() {
        return DateTime.now()
            .subtract(Duration(days: DateTime.now().weekday - 1));
      }

      final List<DateTime> weekList = [];
      final dateNow = DateTime.now();
      final weekfirstDay = firstDayofWeek();
      print((dateNow.day / 7).round());

      final date = DateTime.now();

      if (weekfirstDay.weekday == DateTime.monday) {
        for (var i = 0; i < 7; i++) {
          weekList.add(
            weekfirstDay.add(
              Duration(days: i),
            ),
          );
        }
      }

      print(weekList);
      return weekList;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (var i = 0; i < 7; i++)
          GestureDetector(
            onTap: () {
              print(habitList);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: giveDateRange()[i].day == DateTime.now().day
                      ? Border.all(
                          color: colorthemeContext(context).outline,
                          width: 2,
                          strokeAlign: BorderSide.strokeAlignCenter)
                      : null,
                  borderRadius: BorderRadius.circular(10),
                  color: giveDateRange()[i].day == DateTime.now().day
                      ? colorthemeContext(context).primaryContainer
                      : colorthemeContext(context).surfaceVariant
                  // color: isToday(giveDateRange()[i])
                  //     ? colorthemeContext(context).primaryContainer
                  //     : colorthemeContext(context).surfaceVariant,
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dateFormatter(giveDateRange()[i]).split('-')[0],
                    style: textthemeContext(context).headlineSmall,
                  ),
                  Text(
                    // Constants.days[i].substring(0, 3),
                    dateFormatter(giveDateRange()[i]).split('-')[1],
                    style: textthemeContext(context).titleMedium,
                  ),
                ],
              ),
            ),
          )
      ],
    );
  }
}
