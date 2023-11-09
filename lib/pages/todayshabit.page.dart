import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/controller/habit.controller.dart';
import 'package:habitapp/models/user_habit.model.dart';
import 'package:habitapp/pages/addhabit.page.dart';
import 'package:habitapp/widget/daily_habit_marker_widget.dart';
import 'package:habitapp/widget/habit_list.dart';

class TodaysHabitPage extends ConsumerWidget {
  const TodaysHabitPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeContext = Theme.of(context).colorScheme;
    final confettiController = ConfettiController();
//  tells the current brightness
    Color checkBrightness(Color darkColor, Color lightColor) {
      return Theme.of(context).brightness == Brightness.dark
          ? darkColor
          : lightColor;
    }

    final habitsTemp = ref.read(habitListProvider);
    final habitController = HabitController(habitList: habitsTemp);
    final isTodaysHabit = habitController.isTodaysHabit(habitsTemp);

    return Scaffold(
      backgroundColor: checkBrightness(
          Colors.black, Theme.of(context).colorScheme.background),
      extendBody: false,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const Text(
          "h-bit",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            iconSize: MediaQuery.of(context).size.shortestSide / 14,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AddHabitPage(),
              ));
            },
            icon: Icon(
              Icons.add_rounded,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ],
        forceMaterialTransparency: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: isTodaysHabit.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DailyProgressWidget(habit: habitsTemp),
                    const SizedBox(height: 15),
                    HabitList(
                        habit: ref.watch(habitListProvider),
                        confettiController: confettiController),
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.list_rounded,
                        size: 80,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      Text(
                        "No habit for today",
                        style: Theme.of(context).textTheme.displayMedium!.merge(
                              TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FilledButton.tonal(
                          onPressed: () {}, child: const Text("Create Habit"))
                    ],
                  ),
                )),
    );
  }
}
