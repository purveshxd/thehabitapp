import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/localStorage/habit_storage.dart';
import 'package:habitapp/models/habit.model.dart';

final habitStateNotifierProvider =
    StateNotifierProvider<HabitStateNotifier, List<Habit>>(
        (ref) => HabitStateNotifier(HabitStorage()));

class HabitStateNotifier extends StateNotifier<List<Habit>> {
  final HabitStorage _localStorage;

  HabitStateNotifier(this._localStorage) : super([]) {
    loadHabits();
  }

  loadHabits() {
    _localStorage.loadHabitList();
    final habitList = _localStorage.habitList;
    print(habitList);
    state = [...habitList];
  }

  addHabit(Habit habit) {
    _localStorage.addHabit(habit);
    loadHabits();
  }

  toggleHabitsComplete(String id) {
    _localStorage.toggleHabitComplete(id);
    loadHabits();
  }

  deleteHabit(String id) {
    _localStorage.deleteHabit(id);
    loadHabits();
  }
}
