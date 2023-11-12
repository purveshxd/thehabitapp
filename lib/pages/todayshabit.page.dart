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
    // theme context for color
    final colorthemeContext = Theme.of(context).colorScheme;
    // theme context for text
    final textthemeContext = Theme.of(context).textTheme;

    // final confettiController = ConfettiController();

//  tells the current brightness
    Color checkBrightness(Color darkColor, Color lightColor) {
      return colorthemeContext.brightness == Brightness.dark
          ? darkColor
          : lightColor;
    }

    // final habitsTemp = ref.read(habitListProvider);
    final habitsTemp = ref.watch(habitStateNotifierProvider);

    // habitController
    final habitController = HabitController(habitList: habitsTemp);

    final isTodaysHabit = habitController.todaysHabitList(habitsTemp);

    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      backgroundColor:
          checkBrightness(Colors.black, colorthemeContext.background),
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
              color: colorthemeContext.onBackground,
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
                        color: colorthemeContext.onBackground,
                      ),
                      Text(
                        "No habit for today",
                        style: textthemeContext.displayMedium!.merge(
                          TextStyle(
                            color: colorthemeContext.onBackground,
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
                )),
    );
  }
}
