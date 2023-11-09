import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/models/habit.model.dart';

class HabitList extends Notifier<List<Habit>> {
  @override
  List<Habit> build() => [
        Habit(
          habitName: "Study",
          days: [Days.wed, Days.sat, Days.tue],
          isCompleted: true,
        ),
        Habit(
          habitName: "Name",
          days: [Days.wed, Days.fri, Days.tue],
        ),
        Habit(
          habitName: "Study",
          days: [Days.thu],
          isCompleted: true,
        ),
        Habit(
            habitName: "Study",
            days: [Days.sat, Days.fri, Days.tue],
            isCompleted: true),
        Habit(
          habitName: "Study",
          days: [Days.mon, Days.sat],
        ),
      ];

  // add habit
  void addHabit(Habit habit) {
    state = [...state, Habit(habitName: habit.habitName, days: habit.days)];
  }

  // Habit isCompleted toggle
  // void toggleCompleted(String uuid) {
  //   state = [
  //     for (final habit in state)
  //       if (habit.uuid == uuid)
  //         Habit(
  //             uuid: habit.uuid,
  //             habitName: habit.habitName,
  //             days: habit.days,
  //             isCompleted: !habit.isCompleted)
  //       else
  //         habit,
  //   ];
  // }

  // edit habit
  // void editHabit({required String habitName, required String uuid}) {
  //   state = [
  //     for (final habit in state)
  //       if (habit.uuid == uuid)
  //         Habit(
  //           uuid: habit.uuid,
  //           habitName: habitName,
  //           days: habit.days,
  //         )
  //       else
  //         habit,
  //   ];
  // }

  void deleteHabit(Habit delHabit) {
    state.remove(delHabit);
  }
}
