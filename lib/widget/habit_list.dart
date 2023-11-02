import 'package:flutter/material.dart';
import 'package:habitapp/constants/components.dart';
import 'package:habitapp/habit.controller.dart';
import 'package:habitapp/models/habit.model.dart';

class HabitList extends StatelessWidget {
  final List<Habit> habit;
  const HabitList({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: habit.length,
          itemBuilder: (context, index) {
            // is habit set for today
            bool isTodayHabit(List<Habit> habitList) {
              bool temp = false;
              temp = habitList
                  .elementAt(index)
                  .days
                  .map((e) => e.name)
                  .toList()
                  .contains(
                    dateFormatter(DateTime.now()).split('-')[1].toLowerCase(),
                  );
              return temp;
            }

            if (isTodayHabit(habit)) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: FilledButton.tonalIcon(
                  icon: !habit[index].isCompleted
                      ? Container()
                      : const Icon(Icons.check),
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: !habit[index].isCompleted
                        ? Theme.of(context).colorScheme.secondaryContainer
                        : Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                  label: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(habit[index].habitName),
                  ),
                ),
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
