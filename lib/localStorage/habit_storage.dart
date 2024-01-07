import 'package:habitapp/models/habit.model.dart';
import 'package:hive/hive.dart';

class HabitStorage {
  List<Habit> habitList = [];
  final box = Hive.box('habitStorage');
  // LocalStorage() {
  //   getHabitList();
  // }

  void loadHabitList() {
    if (box.get('HABITS') == null) {
      createInitialData();
    } else {
      getHabitList();
    }
  }

  void createInitialData() {
    habitList = [
      Habit(
        habitName: "This is Kaizen, a habit tracker app",
        days: [Days.fri, Days.mon, Days.sat, Days.sat, Days.wed],
        isCompleted: false,
      ),
      Habit(
        habitName: "Example habit, try to tap on the tick mark",
        days: Days.values,
        isCompleted: false,
      ),
    ];
    box.put("dateJoined", DateTime.now());
    print("initial == ${habitList}");
  }

  dynamic getDateJoined() {
    final dateJoined = box.get('dateJoined');
    return dateJoined;
  }

// get the habit list from localStorage
  void getHabitList() {
    final habits = box.get('HABITS');

    final habitListTemp = (habits as List).map((e) => e as Habit).toList();
    habitList = habitListTemp;
    print("get == ${habitList}");
  }

// add habit to the local storage
  addHabit(Habit habit) {
    habitList.add(habit);
    box.put("HABITS", habitList);
    print(habit.id);
  }

  deleteHabit(String id) {
    habitList.removeWhere((element) => element.id == id);
    box.put('HABITS', habitList);
  }

  toggleHabitComplete(String id) {
    // final habitList = getHabitList();
    // print(id);

    final index = habitList.indexWhere((element) => element.id == id);
    final habit = habitList.firstWhere((element) => element.id == id);

    // print("OLD ID${habit.id}");
    if (index != -1) {
      final updatedHabit = habit.copyWith(isCompleted: !habit.isCompleted);
      // print("NEw ID${updatedHabit.id}");
      habitList.removeAt(index);
      habitList.insert(index, updatedHabit);
      box.put("HABITS", habitList);
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
