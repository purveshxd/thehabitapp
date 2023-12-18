// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habitapp/constants/components.dart';
import 'package:habitapp/localStorage/local_store.dart';
import 'package:habitapp/style/style.controller.dart';

class WeeklyCalendar extends StatelessWidget {
  final dynamic habitList;
  const WeeklyCalendar({super.key, required this.habitList});

  @override
  Widget build(BuildContext context) {
// generates list of days in week
    List<DateTime> giveDateRange() {
      final List<DateTime> weekList = [];
      // DateTime().
      final date = DateTime.now().weekday == 0
          ? DateTime.now()
          : LocalStorage().getDateJoined();

      for (var i = 0; i < 7; i++) {
        weekList.add(
          date.add(
            Duration(days: i),
          ),
        );
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
