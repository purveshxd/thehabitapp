import 'package:flutter/material.dart';
import 'package:habitapp/constants/components.dart';
import 'package:habitapp/controller/habit.controller.dart';
import 'package:habitapp/models/habit.model.dart';
import 'package:habitapp/widget/daily_habit_marker_widget.dart';
import 'package:habitapp/widget/habit_list.dart';

class TodaysHabitPage extends StatelessWidget {
  const TodaysHabitPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Habit> habitsTemp = [
      Habit(habitName: "Study", days: [Days.sat, Days.wed], isCompleted: true),
      Habit(habitName: "Name", days: [Days.fri]),
      Habit(habitName: "Study", days: [Days.thu], isCompleted: true),
      Habit(habitName: "Study", days: [Days.sat, Days.fri], isCompleted: true),
      Habit(habitName: "Study", days: [Days.mon, Days.sat]),
    ];
    final habitController = HabitController(habitList: habitsTemp);
    final isTodaysHabit = habitController.isTodaysHabit(habitsTemp);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: isTodaysHabit.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DailyProgressWidget(habit: habitsTemp),
                  const SizedBox(height: 15),
                  HabitList(habit: habitsTemp),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.list_rounded,
                      size: 80,
                    ),
                    Text(
                      "No habit for today",
                      style: Theme.of(context).textTheme.displayMedium!.merge(
                            const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                    ),
                  ],
                ),
              ));
  }
}
