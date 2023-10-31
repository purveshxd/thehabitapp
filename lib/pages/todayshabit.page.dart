import 'package:flutter/material.dart';
import 'package:habitapp/widget/daily_habit_marker_widget.dart';
import 'package:habitapp/widget/habit_list.dart';
import 'package:habitapp/widget/weekly_calendar.dart';

class TodaysHabitPage extends StatelessWidget {
  const TodaysHabitPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DailyProgressWidget(),
          SizedBox(height: 15),
          HabitList(),
        ],
      ),
    );
  }
}
