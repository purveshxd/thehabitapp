import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/models/habit.model.dart';
import 'package:habitapp/pages/habitdetails.page.dart';
import 'package:habitapp/style/style.controller.dart';
import 'package:habitapp/widget/weekly_calendar.dart';
import 'package:intl/intl.dart';

class HabitTile extends ConsumerWidget {
  final Habit habit;
  final String? day;
  final void Function()? toggleControl;
  final bool isWeeklyTile;

  const HabitTile({
    super.key,
    required this.habit,
    this.toggleControl,
    required this.isWeeklyTile,
    this.day,
  });

  @override
  Widget build(BuildContext context, ref) {
/*




*/
    bool isHabitComplete() {
      final currentWeek = ref.watch(weekProvider);
      final firstDateofWeek = currentWeek.first;

      final dateList = habit.habitCompletions.where((element) {
        if (DateTime(element.year, element.month, element.day) ==
                DateTime(firstDateofWeek.year, firstDateofWeek.month,
                    firstDateofWeek.day) ||
            DateTime(element.year, element.month, element.day).isAfter(
              DateTime(firstDateofWeek.year, firstDateofWeek.month,
                  firstDateofWeek.day),
            )) {
          return true;
        } else {
          return false;
        }
      }).toList();
      final List<String> daysList = dateList.map((date) {
        final formattedDate = DateFormat('E').format(date).toLowerCase();
        return formattedDate;
      }).toList();

      return daysList.contains(day);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: FilledButton.tonal(
              onPressed: () {
                // debugPrint('Loading habit');
                // // navigates to a details page of habit
                // showDialog(
                //   context: context,
                //   builder: (context) => const Dialog(
                //     child: Padding(
                //       padding: EdgeInsets.all(20.0),
                //       child: Row(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           CircularProgressIndicator(),
                //           SizedBox(width: 25),
                //           Text("Loading habit...")
                //         ],
                //       ),
                //     ),
                //   ),
                // );

                // Future.delayed(const Duration(milliseconds: 500), () {
                //   Navigator.pop(context);
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => HabitDetailsPage(habit: habit),
                //     ),
                //   );
                // });
              },
              style: FilledButton.styleFrom(
                backgroundColor: isWeeklyTile
                    ? isHabitComplete()
                        ? Colors.green
                        : null
                    : colorthemeContext(context).secondaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(10),
                // backgroundColor:
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  // '${habit.habitName.capitalize()}\nDateJoined - ${LocalStorage().getDateJoined()}\nHabit Created - ${habit.habitCreated}',
                  // '${habit.habitName.capitalize()}  ${habit.id}',
                  habit.habitName[0].toUpperCase() +
                      habit.habitName.substring(1),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                ),
              ),
            ),
          ),
          Visibility(
            visible: toggleControl != null,
            replacement: const SizedBox(),
            child: Flexible(
              flex: 1,
              child: IconButton.filledTonal(
                isSelected: !habit.isCompleted,
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: !habit.isCompleted
                      ? Theme.of(context).colorScheme.secondaryContainer
                      : Colors.green[600],
                ),
                onPressed: toggleControl,
                icon: const Icon(
                  Icons.check_rounded,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
