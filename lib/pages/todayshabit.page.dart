import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/controller/habit.controller.dart';
import 'package:habitapp/models/user_habit.model.dart';
import 'package:habitapp/pages/addhabit.page.dart';
import 'package:habitapp/style/style.controller.dart';
import 'package:habitapp/widget/daily_habit_marker_widget.dart';
import 'package:habitapp/widget/habit_list.dart';

class TodaysHabitPage extends ConsumerWidget {
  const TodaysHabitPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final confettiController = ConfettiController();

//  tells the current brightness
    Color checkBrightness(Color darkColor, Color lightColor) {
      return colorthemeContext(context).brightness == Brightness.dark
          ? darkColor
          : lightColor;
    }

    // final habitsTemp = ref.read(habitListProvider);
    final habitsTemp = ref.watch(habitStateNotifierProvider);

    // habitController
    final habitController = HabitController(habitList: habitsTemp);

    final isTodaysHabit = habitController.todaysHabitList(habitsTemp);
    return isTodaysHabit.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DailyProgressWidget(habit: habitsTemp),
              const SizedBox(height: 15),
              HabitList(habitList: ref.watch(habitStateNotifierProvider)),
            ],
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.list_rounded,
                  size: 80,
                  color: colorthemeContext(context).onBackground,
                ),
                Text(
                  "No habit for today",
                  style: textthemeContext(context).displayMedium!.merge(
                        TextStyle(
                          color: colorthemeContext(context).onBackground,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FilledButton.tonal(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddHabitPage(),
                      ));
                    },
                    child: const Text("Create Habit"))
              ],
            ),
          );
  }
}
