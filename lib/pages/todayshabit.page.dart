import 'package:flutter/material.dart';
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
      Habit(habitName: "Study", days: [Days.wed, Days.sat]),
      Habit(
          habitName: "Name",
          days: [Days.wed, Days.sat, Days.fri],
          isCompleted: false),
      Habit(
          habitName: "Study",
          days: [Days.mon, Days.sat, Days.thu],
          isCompleted: false),
      Habit(
          habitName: "Study",
          days: [Days.mon, Days.sat, Days.thu, Days.fri],
          isCompleted: true),
      Habit(habitName: "Study", days: [Days.mon, Days.sat]),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DailyProgressWidget(
            habit: habitsTemp,
          ),
          const SizedBox(height: 15),
          HabitList(habit: habitsTemp),
        ],
      ),
    );
  }
}
