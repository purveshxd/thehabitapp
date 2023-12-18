import 'package:flutter/material.dart';
import 'package:habitapp/pages/all_habits.page.dart';
import 'package:habitapp/pages/todayshabit.page.dart';

class Constants {
  static List<List> drawerList = [
    ["Today's habit", const Icon(Icons.list_rounded), const TodaysHabitPage()],
    // ['Summary', const Icon(Icons.table_rows_rounded)],
    ['All habits', const Icon(Icons.grid_3x3_rounded), const AllHabitsPage()],
    // ['Setting', const Icon(Icons.settings_rounded)]
  ];

  static List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
}
