import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/constants/components.dart';
import 'package:habitapp/models/habit.model.dart';
import 'package:habitapp/controller/habit.notifier.dart';
import 'package:habitapp/style/style.controller.dart';
import 'package:habitapp/widget/weekly_calendar.dart';

class HabitDetailsPage extends ConsumerWidget {
  final Habit habit;
  const HabitDetailsPage({super.key, required this.habit});

  @override
  Widget build(BuildContext context, ref) {
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

    // List<bool> getBoolList() {
    //   final weekList = giveDateRange();
    //   // final List<bool> habitCompleteBool = [];
    //   final savedDate = habit.habitCompletions;
    //   final list = List.generate(7, (index) => false);
    //   final List<DateTime> listDate = List.generate(7, (index) {
    //     return savedDate ? DateTime(1997) : savedDate[index];
    //   });
    //   for (var i = 0; i < 7; i++) {
    //     if (DateTime(listDate[i].year, listDate[i].month, listDate[i].day) ==
    //         DateTime(weekList[i].year, weekList[i].month, weekList[i].day)) {
    //       // habitCompleteBool.add(true);
    //       list.removeAt(i);
    //       list.insert(i, true);
    //       debugPrint("TRUE");
    //       // return true;
    //     }
    //     // return false;
    //   }

    //   return list;
    // }

    // final List<bool> listBool = getBoolList();

    dateMapFunction() {
      Map<DateTime, int> dateDone = {};
      for (var element in habit.habitCompletions) {
        final newElement = {element: 1};
        dateDone.addAll(newElement);
      }
      return dateDone;
    }

    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        // title: const Text("Habit"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Delete the habit?"),
                  content: const Text(
                      "Are you sure you want to delete this habit ?"),
                  actions: [
                    FilledButton.tonal(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"),
                    ),
                    FilledButton.tonalIcon(
                      style: FilledButton.styleFrom(
                          textStyle: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onErrorContainer),
                          backgroundColor:
                              Theme.of(context).colorScheme.errorContainer),
                      onPressed: () {
                        ref
                            .watch(habitStateNotifierProvider.notifier)
                            .deleteHabit(habit.id);

                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.delete_rounded),
                      label: const Text("Delete"),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(
              Icons.delete_rounded,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: colorthemeContext(context).secondaryContainer,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  habit.habitName.capitalize()!,
                  style: (Theme.of(context).textTheme.headlineMedium)!.merge(
                    const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                // shrinkWrap: true,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10, right: 5),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        tileColor: colorthemeContext(context).tertiaryContainer,
                        title: const Text("Reminder"),
                        trailing: const Icon(Icons.notifications_rounded),
                        subtitle: Text(startDateFormat(habit.habitCreated)),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0, bottom: 10, left: 5),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        tileColor: colorthemeContext(context).tertiaryContainer,
                        title: const Text("Habit Start"),
                        trailing: const Icon(Icons.calendar_today),
                        subtitle: Text(startDateFormat(habit.habitCreated)),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: colorthemeContext(context).tertiaryContainer,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "This week",
                      style: (Theme.of(context).textTheme.labelLarge)!.merge(
                        const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var i = 0; i < 7; i++)
                          Flexible(
                            child: IconButton.filledTonal(
                              style: IconButton.styleFrom(
                                  // backgroundColor: listBool[i]
                                  //     ? Colors.green
                                  backgroundColor:
                                      colorthemeContext(context).primary,
                                  shape: const StadiumBorder()),
                              onPressed: () {},
                              icon: Text(
                                Days.values[i].name[0].capitalize()!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: colorthemeContext(context).onPrimary,
                                ),
                              ),
                            ),
                          )
                        // Container(
                        //   padding: const EdgeInsets.all(10),
                        //   decoration: BoxDecoration(
                        //     color: colorthemeContext(context)
                        //         .onTertiaryContainer,
                        //     // shape: BoxShape.circle,

                        //     borderRadius: BorderRadius.circular(15),
                        //   ),
                        //   child: Text(
                        //     element.name[0].capitalize(),
                        //     style: TextStyle(
                        //         color: colorthemeContext(context).onTertiary),
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
              ),
              HeatMap(
                startDate: habit.habitCreated,
                endDate: ref.watch(weekProvider).last,
                colorMode: ColorMode.color,
                showText: true,
                textColor: colorthemeContext(context).onErrorContainer,
                size: 25,
                datasets: dateMapFunction(),
                scrollable: true,

                colorsets: {
                  1: Colors.green.shade600,
                },
                defaultColor: colorthemeContext(context).errorContainer,
                showColorTip: false,
                
                onClick: (value) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(value.toString())));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
