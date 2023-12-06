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

final habitStateNotifierProvider =
    StateNotifierProvider<HabitStateNotifier, List<Habit>>(
        (ref) => HabitStateNotifier(LocalStorage()));
