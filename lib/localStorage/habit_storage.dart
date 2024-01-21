import 'package:flutter/material.dart';
import 'package:habitapp/main.dart';
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
        days: Days.values,
        isCompleted: false,
        habitCreated: DateTime(2023, 11, 5),
        habitCompletions: [
          DateTime(2023, 11, 5),
          DateTime(2023, 11, 6),
          DateTime(2023, 11, 7),
          DateTime(2023, 11, 8),
          DateTime(2023, 11, 9),
          DateTime(2023, 11, 10),
          DateTime(2024, 01, 19),
          DateTime(2024, 01, 18),
        ],
      ),
      Habit(
        habitCreated: DateTime(2023, 12, 5),
        habitCompletions: [
          DateTime(2024, 01, 19),
        ],
        habitName: "Example habit, try to tap on the tick mark",
        days: Days.values,
        isCompleted: false,
      ),
    ];
  }

// get the habit list from localStorage
  void getHabitList() {
    // previous date saved from database
    final today = DateTime.now();
    // var previousDate = DateTime.parse(box.get('last-open'));
    debugPrint(preDate.toString());
    // var previousDate = DateTime(2024, 01, 15);
    // var previousDate = DateTime(2024, 01, 15);
    // previousDate ??= DateTime.now();
    // diff in days
    final difference =
        DateTime(today.year, today.month, today.day).difference(preDate).inDays;
    // check if the day is After the date today
    // final isAfterDay = previousDate.isAfter(DateTime.now());
    debugPrint(difference.toString());
    if (difference > 0) {
      resetHabit();
    } else {
      final habits = box.get('HABITS');
      final habitListTemp = (habits as List).map((e) => e as Habit).toList();
      habitList = habitListTemp;
    }
  }

  void resetHabit() {
    debugPrint("Entered Reset");
    // new list
    List<Habit> newList = [];

// get habitList from storage
    var habits = box.get('HABITS');
    var habitListTemp = (habits as List).map((e) => e as Habit).toList();
    // debugPrint("before change List - ${habitListTemp}");

    for (var element in habitListTemp) {
      // debugPrint("indv habit before change - ${element}");
      final newHabit = element.copyWith(isCompleted: false);
      // debugPrint("indv habit after change - ${newHabit}");
      newList.add(newHabit);
    }
    // debugPrint("new List - ${newList}");
    box.put("HABITS", newList);

    habits = box.get('HABITS');
    habitListTemp = (habits as List).map((e) => e as Habit).toList();
    // debugPrint("before change List - ${habitListTemp}");
    habitList = habitListTemp;
    final today = DateTime.now();

    box.put(
        'last-open', DateTime(today.year, today.month, today.day).toString());
    preDate = DateTime.parse(box.get('last-open'));

    debugPrint("EXIT PRINT");
  }

// add habit to the local storage
  addHabit(Habit habit) {
    habitList.add(habit);
    box.put("HABITS", habitList);
  }

  deleteHabit(String id) {
    habitList.removeWhere((element) => element.id == id);
    box.put('HABITS', habitList);
  }

  toggleHabitComplete(String id) {
    final index = habitList.indexWhere((element) => element.id == id);
    final habit = habitList.firstWhere((element) => element.id == id);

    if (index != -1) {
      final updatedHabit = habit.copyWith(isCompleted: !habit.isCompleted);
      final listDone = _toggleDateDone(updatedHabit);
      final newHabit = updatedHabit.copyWith(habitCompletions: listDone);
      habitList.removeAt(index);
      habitList.insert(index, newHabit);
      box.put("HABITS", habitList);
    }
  }

  List<DateTime> _toggleDateDone(Habit habit) {
    List<DateTime> datesDone = habit.habitCompletions;
    final today = DateTime.now();
    final date = DateTime(today.year, today.month, today.day);
    if (habit.isCompleted) {
      datesDone.add(date);
    } else {
      datesDone.removeWhere(
        (element) => element == date,
      );
    }
    return datesDone;
  }
}
