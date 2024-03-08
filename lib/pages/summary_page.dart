
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/controller/habit.notifier.dart';
import 'package:habitapp/style/style.controller.dart';
import 'package:habitapp/widget/headline.widget.dart';

class SummaryPage extends ConsumerWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    checkBrightness() => Theme.of(context).brightness == Brightness.light;

    final habitList = ref.watch(habitStateNotifierProvider);

    startDate() {
      final habitCreated = habitList.map((e) => e.habitCreated).toList();
      debugPrint("BEFORE ____ ${habitCreated.toString()}");
      habitCreated.sort();
      // debugPrint(habitCreated.toString());
      debugPrint("AFTER ____ ${habitCreated.toString()}");
      return habitCreated.first;
    }

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
      }
      return dateDone;
    }

    startDate();
    return ListView(
      children: [
        const PageHeadline(headlineText: "Habit Summary"),
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: checkBrightness()
                ? Colors.grey.shade300.withOpacity(.5)
                : colorthemeContext(context).secondaryContainer,
            // : const Color(0xFF0D1117),
            // color: const Color(0xFF0D1117),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Flexible(
                child: HeatMap(
                  startDate: startDate(),
                  showText: false,
                  colorMode: ColorMode.opacity,
                  textColor: checkBrightness() ? Colors.black : Colors.white,
                  size: 27,
                  datasets: dateMapFunction(),
                  scrollable: true,
                  colorsets: const {
                    1: Color(0xFF39D353),
                  },
                  defaultColor: checkBrightness()
                      ? Colors.grey.shade50
                      : colorthemeContext(context).secondary,
                  showColorTip: false,
                  onClick: (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(value.toString())));
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
