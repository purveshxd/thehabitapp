import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/constants/components.dart';
import 'package:habitapp/localStorage/user_storage.dart';
import 'package:habitapp/models/habit.model.dart';
import 'package:habitapp/controller/habit.notifier.dart';
import 'package:habitapp/style/style.controller.dart';

class HabitDetailsPage extends ConsumerWidget {
  final Habit habit;
  const HabitDetailsPage({super.key, required this.habit});

  @override
  Widget build(BuildContext context, ref) {
    dateMapFunction() {
      Map<DateTime, int> dateDone = {};
      for (var element in habit.habitCompletions) {
        final newElement = {element: 1};
        dateDone.addAll(newElement);
      }
      print(dateDone);
      return dateDone;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Habit detail"),
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
          child: Column(
            // shrinkWrap: true,
            children: [
              Text(
                habit.habitName.capitalize(),
                style: (Theme.of(context).textTheme.headlineMedium)!.merge(
                  const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              HeatMap(
                startDate: habit.habitCreated,
                colorMode: ColorMode.color,
                showText: false,
                size: 35,
                datasets: dateMapFunction(),
                scrollable: true,
                colorsets: {
                  1: Colors.green.shade600,
                  
                },
                defaultColor: colorthemeContext(context).errorContainer,
                // defaultColor: colorthemeContext(context),
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
