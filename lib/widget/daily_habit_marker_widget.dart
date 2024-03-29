import 'package:flutter/material.dart';
import 'package:habitapp/style/style.controller.dart';
import 'package:habitapp/utils/habit_utils.dart';

import 'package:habitapp/models/habit.model.dart';
import 'package:habitapp/widget/headline.widget.dart';

class DailyProgressWidget extends StatelessWidget {
  final List<Habit> habit;

  const DailyProgressWidget({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    final habitController = HabitUtils(habitList: habit);
    debugPrint((habitController.completedHabit(habit) /
            habitController.totalHabit(habit))
        .toString());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            const PageHeadline(
              headlineText: "Today's Habits",
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
            dimension: MediaQuery.of(context).size.width / 5,
            child: Stack(
              fit: StackFit.passthrough,
              alignment: AlignmentDirectional.center,
              children: [
                Visibility(
                  visible: habitController.completedHabit(habit) /
                          habitController.totalHabit(habit) ==
                      1,
                  child: IconButton.filledTonal(
                    onPressed: () {},
                    icon: const Icon(Icons.check_circle_rounded),
                    color: colorthemeContext(context).primary,
                  ),
                ),
                CircularProgressIndicator(
                  value: habitController.completedHabit(habit) /
                      habitController.totalHabit(habit),
                  strokeCap: StrokeCap.round,
                  strokeWidth: 8,
                  backgroundColor:
                      colorthemeContext(context).secondaryContainer,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
