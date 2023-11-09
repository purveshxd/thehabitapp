import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/constants/components.dart';
import 'package:habitapp/models/habit.model.dart';
import 'package:habitapp/models/user_habit.model.dart';
import 'package:habitapp/widget/habit_tile.dart';

class HabitList extends ConsumerWidget {
  final List<Habit> habit;
  final ConfettiController confettiController;
  const HabitList({
    required this.confettiController,
    super.key,
    required this.habit,
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

    markHabitDone(Habit markHabit) {
      ref.watch(habitListProvider.notifier).update((state) {
        return state = [
          for (final habit in state)
            if (habit == markHabit)
              Habit(
                  habitName: markHabit.habitName,
                  days: markHabit.days,
                  isCompleted: !habit.isCompleted)
            else
              habit,
        ];
      });
    }

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
                    onPressed: () {
                      // confettiWorking();

                      markHabitDone(habit[index]);
                    },
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
                    onPressed: () {
                      markHabitDone(habit[index]);
                    },
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
