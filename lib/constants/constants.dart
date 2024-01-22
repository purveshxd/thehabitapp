import 'package:flutter/material.dart';
import 'package:habitapp/pages/weekly_habit.page.dart';
import 'package:habitapp/pages/todayshabit.page.dart';

class Constants {
  static List<List> drawerList = [
    ["Today's habit", const Icon(Icons.list_rounded), const TodaysHabitPage()],
    // ['Summary', const Icon(Icons.table_rows_rounded)],
    ['All habits', const Icon(Icons.grid_3x3_rounded), const WeeklyHabitPage()],
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

String portfolio = 'https://flutter-portfolio-ea261.firebaseapp.com';

List socialList = [
  ["Github", "assets/logo/github.png", "https://github.com/purveshxd"],
  // ["Gmail", "assets/logo/email.png", "mailto:do.psd23@gmail.com"],
  [
    "Linkedin",
    "assets/logo/linkedin.png",
    "https://www.linkedin.com/in/purveshxd/"
  ],
  [
    "Instagram",
    "assets/logo/instagram.png",
    "https://www.instagram.com/purveshxd/"
  ],
  [
    "X/Twitter",
    "assets/logo/twitter.png",
    "https://twitter.com/xdpurvesh",
  ],
  // [
  //   "Resume",
  //   "assets/logo/file.png",
  //   "https://drive.google.com/file/d/1PQMwKtVOhmG9H6LKqBBMRdG0D4EqsgAP/view?usp=drive_link"
  // ],
];
