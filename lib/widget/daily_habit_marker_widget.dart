import 'package:flutter/material.dart';
import 'package:habitapp/constants/components.dart';
import 'package:habitapp/controller/habit.controller.dart';

import 'package:habitapp/models/habit.model.dart';

class DailyProgressWidget extends StatelessWidget {
  final List<Habit> habit;

  const DailyProgressWidget({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    final habitController = HabitController(habitList: habit);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: TextSpan(
                text: "Today's",
                style: Theme.of(context).textTheme.headlineLarge,
                children: [
                  TextSpan(
                    text: " Habits",
                    style: (Theme.of(context).textTheme.headlineLarge)!.merge(
                      const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                "${habitController.completedHabit(habit)} of ${habitController.totalHabit(habit)} completed",
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox.square(
            dimension: 100,
            child: CircularProgressIndicator(
              value: habitController.completedHabit(habit) /
                  habitController.totalHabit(habit),
              strokeCap: StrokeCap.round,
              strokeWidth: 8,
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            ),
          ),
        ),
      ],
    );
  }
}
