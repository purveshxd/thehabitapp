import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/models/habit.model.dart';
import 'package:habitapp/controller/habit.notifier.dart';
import 'package:habitapp/style/style.controller.dart';
import 'package:habitapp/widget/habit_tile.dart';
import 'package:habitapp/widget/headline.widget.dart';
import 'package:habitapp/widget/weekly_calendar.dart';
import 'package:intl/intl.dart';

final selectedDayProvider = StateProvider<Days>((ref) {
  final formattedDate = DateFormat('E').format(DateTime.now());

  return Days.values
      .firstWhere((element) => element.name == formattedDate.toLowerCase());
});

class WeeklyHabitPage extends ConsumerWidget {
  const WeeklyHabitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    bool dayHabit(Habit habit, Days days) {
      return habit.days.contains(days);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeadline(headlineText: "Weekly Habits"),
        const SizedBox(height: 10),
        WeeklyCalendar(
          habitList: ref.watch(habitStateNotifierProvider),
        ),
        const SizedBox(height: 10),
        // Row(
        //   children: [
        //     Text(DateFormat('MMMM').format(DateTime.now()),
        //         style: const TextStyle(
        //             fontWeight: FontWeight.normal, fontSize: 21)),
        //     Text(' Week - ${(DateTime.now().day / 7).round()}',
        //         style: const TextStyle(
        //             fontWeight: FontWeight.normal, fontSize: 21)),
        //   ],
        // ),
        // const SizedBox(height: 10),
        // const Divider(thickness: 2),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   mainAxisSize: MainAxisSize.max,
        //   children: [
        //     for (var element in names) buildChip(context, label: element)
        //   ],
        // ),
        Flexible(
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: ref.watch(habitStateNotifierProvider).length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (dayHabit(ref.watch(habitStateNotifierProvider)[index],
                    ref.watch(selectedDayProvider))) {
                  return HabitTile(
                      day: ref.watch(selectedDayProvider).name,
                      isWeeklyTile: true,
                      habit: ref.watch(habitStateNotifierProvider)[index]);
                } else {
                  return Container();
                }
              }),
        ),
      ],
    );
  }

  Widget buildChip(context, {required String label}) {
    return ActionChip(
      label: Text(label),
      side: BorderSide.none,
      shape: const StadiumBorder(),
      backgroundColor: colorthemeContext(context).secondaryContainer,
      onPressed: () {
        debugPrint(label);
      },
    );
  }
}
