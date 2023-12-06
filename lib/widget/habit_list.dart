import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/controller/habit.controller.dart';
import 'package:habitapp/models/habit.model.dart';
import 'package:habitapp/models/user_habit.model.dart';
import 'package:habitapp/widget/habit_tile.dart';

// to check todays habit complete
final todaysHabitCompleteProvider = StateProvider((ref) => false);

class HabitList extends ConsumerWidget {
  final List<Habit> habitList;
  // final ConfettiController confettiController;
  const HabitList({
    // required this.confettiController,
    super.key,
    required this.habitList,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bool confettieState = false;
    // confettiWorking() {
    //   print("Started");
    //   confettiController.play();
    //   Future.delayed(
    //     const Duration(seconds: 2),
    //     () {
    //       confettiController.stop();
    //       print("Stopped");
    //     },
    //   );
    // }

    final habitController = HabitController(habitList: habitList);

    markHabitDone(Habit markHabit) {
      ref
          .watch(habitStateNotifierProvider.notifier)
          .toggleHabitsComplete(markHabit.id);
    }

    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(), shrinkWrap: true,
        // mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          // for habit remaining for today

          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: habitList.length,
              itemBuilder: (context, index) {
                if (HabitController(habitList: habitList).isTodayHabit(index) &&
                    !habitList[index].isCompleted) {
                  // print(habit[index]);
                  return HabitTile(
                    toggleControl: () {
                      // confettiWorking();

                      markHabitDone(habitList[index]);
                    },
                    habit: habitList[index],
                  );
                } else {
                  return const SizedBox();
                }
              }),
          // completed habit for today

          Visibility(
            visible: habitController.completedHabit(habitList) != 0,
            child: Column(
              children: [
                Visibility(
                  visible: habitController.completedHabit(habitList) ==
                      habitController.totalHabit(habitList),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Congrats🥳 You completed todays habit",
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
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Done",
                        style: Theme.of(context).textTheme.labelLarge!.merge(
                            TextStyle(
                                color: Theme.of(context).colorScheme.tertiary)),
                      ),
                    ),
                    Flexible(
                        child: Divider(
                            thickness: 2,
                            color: Theme.of(context).colorScheme.tertiary)),
                  ],
                ),
              ],
            ),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: habitList.length,
              itemBuilder: (context, index) {
                // print(habit[index]);
                if (HabitController(habitList: habitList).isTodayHabit(index) &&
                    habitList[index].isCompleted) {
                  return HabitTile(
                    toggleControl: () {
                      markHabitDone(habitList[index]);
                    },
                    habit: habitList[index],
                  );
                } else {
                  return Container();
                }
              })
        ],
      ),
    );
  }
}
