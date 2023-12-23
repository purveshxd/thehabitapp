import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/controller/habit.controller.dart';
import 'package:habitapp/models/user_habit.model.dart';
import 'package:habitapp/widget/headline.widget.dart';
import 'package:habitapp/widget/weekly_calendar.dart';
import 'package:intl/intl.dart';

class AllHabitsPage extends ConsumerWidget {
  const AllHabitsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    isDaysHabit() {
      print(ref.watch(habitStateNotifierProvider.notifier));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeadline(headlineText: "All Habits"),

        const SizedBox(height: 10),
        WeeklyCalendar(
          habitList: ref.watch(habitStateNotifierProvider),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              DateFormat('MMMM').format(
                DateTime.now(),
              ),
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 21),
            ),
            Text(
              ' Week - ${(DateTime.now().day / 7).round()}',
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 21),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(thickness: 2),
        // HabitList(habitList: ref.watch(habitStateNotifierProvider))
        // ListView.builder(itemBuilder: (context, index) => ,)
        Flexible(
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (context, index) => ListTile(
                title: Text('$index - name'),
                onTap: () {
                  isDaysHabit();
                }),
          ),
        ),
      ],
    );
  }
}
