import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/controller/habit.notifier.dart';
import 'package:habitapp/localStorage/habit_storage.dart';
import 'package:habitapp/localStorage/user_storage.dart';
import 'package:habitapp/style/style.controller.dart';
import 'package:habitapp/widget/weekly_calendar.dart';

class SummaryPage extends ConsumerWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitList = ref.watch(habitStateNotifierProvider);

    dateMapFunction() {
      Map<DateTime, int> dateDone = {};
      final habitCompletions = habitList.map((habit) {
        final listDates = habit.habitCompletions;
        // print(listDates);
        return listDates;
      }).toList();
      final List<DateTime> listDates = [];

      for (var subList in habitCompletions) {
        for (var element in subList) {
          listDates.add(element);
        }
      }

      for (var element in listDates) {
        int i = 1;
        dateDone.update(
          element,
          (value) => value + 1,
          ifAbsent: () => i,
        );

        i++;
        debugPrint(element.toString());
      }
      print('********************************${dateDone}');
      return dateDone;
    }

    return ListView(
      children: [
        Row(
          children: [
            Flexible(
              child: HeatMap(
                startDate: DateTime.parse(UserStorage().getDateJoined()),
                // endDate: ref.watch(weekProvider).last,
                colorMode: ColorMode.opacity,
                textColor: colorthemeContext(context).onBackground,
                datasets: dateMapFunction(),
                scrollable: true,
                colorsets: const {
                  1: Colors.white,
                },
                defaultColor: colorthemeContext(context).secondaryContainer,
                showColorTip: true,
                onClick: (value) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(value.toString())));
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
