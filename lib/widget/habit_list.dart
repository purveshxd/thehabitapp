import 'package:flutter/material.dart';
import 'package:habitapp/constants/components.dart';
import 'package:habitapp/habit.controller.dart';
import 'package:habitapp/models/habit.model.dart';
import 'package:habitapp/widget/habit_tile.dart';

class HabitList extends StatelessWidget {
  final List<Habit> habit;
  const HabitList({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    // is habit set for today
    bool isTodayHabit(int index) {
      bool temp = false;
      temp = habit.elementAt(index).days.map((e) => e.name).toList().contains(
            dateFormatter(DateTime.now()).split('-')[1].toLowerCase(),
          );
      return temp;
    }

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // for habit remaining for today
          ListView.builder(
              shrinkWrap: true,
              itemCount: habit.length,
              itemBuilder: (context, index) {
                if (isTodayHabit(index) && !habit[index].isCompleted) {
                  // print(habit[index]);
                  return HabitTile(
                    isCompleted: habit[index].isCompleted,
                    habitName: habit[index].habitName,
                  );
                } else {
                  return const SizedBox();
                }
              }),
          // completed habit for today
          ListView.builder(
              shrinkWrap: true,
              itemCount: habit.length,
              itemBuilder: (context, index) {
                // print(habit[index]);
                if (isTodayHabit(index) && habit[index].isCompleted) {
                  return HabitTile(
                    isCompleted: habit[index].isCompleted,
                    habitName: habit[index].habitName,
                  );
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
