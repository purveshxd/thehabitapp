// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:math';

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:habitapp/constants/components.dart';
import 'package:habitapp/models/habit.model.dart';
import 'package:habitapp/pages/all_habits.page.dart';
import 'package:habitapp/style/style.controller.dart';

class WeeklyCalendar extends ConsumerWidget {
  final dynamic habitList;
  const WeeklyCalendar({
    Key? key,
    required this.habitList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
// generates list of days in week
    List<DateTime> giveDateRange() {
      final dateNow = DateTime.now();
      // gives first day of the particular week
      final weekfirstDay =
          dateNow.subtract(Duration(days: dateNow.weekday - 1));
      final List<DateTime> weekList = [];

      for (var i = 0; i < 7; i++) {
        weekList.add(
          weekfirstDay.add(
            Duration(days: i),
          ),
        );
      }

      return weekList;
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: colorthemeContext(context).secondaryContainer,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (var i = 0; i < 7; i++)
            GestureDetector(
              onTap: () {
                ref
                    .watch(selectedDayProvider.notifier)
                    .update((state) => Days.values[i]);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: ref.watch(selectedDayProvider).index == i
                        ? Border.all(
                            color: Colors.white,
                            // color: colorthemeContext(context).outline,
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignCenter)
                        : null,
                    borderRadius: BorderRadius.circular(10),
                    color: giveDateRange()[i].day == DateTime.now().day
                        ? colorthemeContext(context).primary
                        : Colors.transparent),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      dateFormatter(giveDateRange()[i]).split('-')[0],
                      style: textthemeContext(context).titleLarge!.copyWith(
                          color: giveDateRange()[i].day == DateTime.now().day
                              ? colorthemeContext(context).onPrimary
                              : colorthemeContext(context)
                                  .onSecondaryContainer),
                    ),
                    Text(
                      // Constants.days[i].substring(0, 3),
                      dateFormatter(giveDateRange()[i]).split('-')[1],
                      style: textthemeContext(context).titleSmall!.copyWith(
                          color: giveDateRange()[i].day == DateTime.now().day
                              ? colorthemeContext(context).onPrimary
                              : colorthemeContext(context).onSecondaryContainer,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
