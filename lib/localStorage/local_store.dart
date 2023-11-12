import 'package:habitapp/models/habit.model.dart';
import 'package:hive/hive.dart';

class LocalStorage {
  late List<Habit> habitList;
  late Box _box;

  LocalStorage() {
    _box = Hive.box('habitStorage');
    loadData();
  }

  // List<Habit> createInitialData() {
  //   return habitList = [
  //     Habit(
  //         habitName: "Study",
  //         days: [Days.wed, Days.sat, Days.tue],
  //         isCompleted: true),
  //   ];
  // }

// get the habit list from localStorage
  List<Habit> getHabitList() {
    final habits = _box.get('HABITS');
    return (habits as List).map((e) => e as Habit).toList();
    // return habitList;
  }

// add habit to the local storage
  addHabit(Habit habit) {
    habitList = getHabitList();
    habitList.add(habit);
    _box.put("HABITS", habitList);
  }

  loadData() {
    final habitList = _box.get('HABITS');
  }

  // deleteHabit(Habit delHabit) {
  //   habitList = getHabitList();
  //   habitList.remove(delHabit);
  // }

  toggleHabitComplete(String id) {
    final habitList = getHabitList();
    final index = habitList.indexWhere((element) => element.id == id);
    print(habitList[index].toString());
    if (index != -1) {
      final habit = habitList[index];
      final updatedHabit = Habit(
          habitName: habit.habitName,
          days: habit.days,
          isCompleted: !habit.isCompleted);
      habitList.removeAt(index);
      habitList.insert(index, updatedHabit);
      _box.put("HABITS", habitList);
    }
  }
}

// Habit(
//         habitName: "Name",
//         days: [Days.wed, Days.sat, Days.fri],
//       ),
//       Habit(
//         habitName: "Study",
//         days: [],
//         isCompleted: true,
//       ),
//       Habit(habitName: "Study", days: [Days.fri, Days.tue], isCompleted: true),
//       Habit(
//         habitName: "Study",
//         days: [Days.mon, Days.sat],
//       ),
