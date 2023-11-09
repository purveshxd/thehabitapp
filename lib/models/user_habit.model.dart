import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/models/habit.model.dart';

final habitListProvider = StateProvider((ref) => [
      Habit(
        habitName: "Study",
        days: [Days.wed, Days.sat, Days.tue],
        isCompleted: true,
      ),
      Habit(
        habitName: "Name",
        days: [Days.wed, Days.sat, Days.fri],
      ),
      Habit(
        habitName: "Study",
        days: [],
        isCompleted: true,
      ),
      Habit(habitName: "Study", days: [Days.fri, Days.tue], isCompleted: true),
      Habit(
        habitName: "Study",
        days: [Days.mon, Days.sat],
      ),
    ]);
