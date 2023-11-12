import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/localStorage/local_store.dart';
import 'package:habitapp/models/habit.model.dart';

// final habitListProvider =
//     StateProvider<List<Habit>>((ref) => LocalStorage().createInitialData());

class HabitStateNotifier extends StateNotifier<List<Habit>> {
  final LocalStorage _localStorage;

  HabitStateNotifier(this._localStorage) : super([]) {
    loadHabits();
  }

  loadHabits() {
    final habits = _localStorage.getHabitList();
    state = [...habits];
  }

  addHabit(Habit habit) {
    _localStorage.addHabit(habit);
    loadHabits();
  }

  toggleHabitsComplete() {
    //TODO: add habit toggle code
    loadHabits();
  }

  deleteHabit() {
    loadHabits();
  }
}

final habitStateNotifierProvider =
    StateNotifierProvider<HabitStateNotifier, List<Habit>>(
        (ref) => HabitStateNotifier(LocalStorage()));
