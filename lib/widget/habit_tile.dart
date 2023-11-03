import 'package:flutter/material.dart';

class HabitTile extends StatelessWidget {
  // final List<Habit> habit;
  final bool isCompleted;
  final String habitName;
  const HabitTile(
      {super.key,
      // required this.habit,
      required this.isCompleted,
      required this.habitName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FilledButton.tonalIcon(
        icon: !isCompleted ? Container() : const Icon(Icons.check),
        onPressed: () {},
        style: FilledButton.styleFrom(
          backgroundColor: !isCompleted
              ? Theme.of(context).colorScheme.secondaryContainer
              : Colors.green[600],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(10),
        ),
        label: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            habitName,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer),
          ),
        ),
      ),
    );
  }
}
