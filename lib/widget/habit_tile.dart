import 'package:flutter/material.dart';
import 'package:habitapp/constants/components.dart';
import 'package:habitapp/localStorage/local_store.dart';
import 'package:habitapp/models/habit.model.dart';
import 'package:habitapp/pages/habitdetails.page.dart';

class HabitTile extends StatelessWidget {
  // final List<Habit> habit;
  // final bool isCompleted;
  final Habit habit;
  final void Function()? toggleControl;
  const HabitTile(
      {super.key,
      // required this.habit,
      // required this.isCompleted,
      required this.habit,
      required this.toggleControl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        // mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: FilledButton.tonal(
              onPressed: () {
                // navigates to a details page of habit
                showDialog(
                  context: context,
                  builder: (context) => const Dialog(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(width: 25),
                          Text("Loading habit...")
                        ],
                      ),
                    ),
                  ),
                );

                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HabitDetailsPage(habit: habit),
                    ),
                  );
                });
              },
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '${habit.habitName.capitalize()}\nDateJoined - ${LocalStorage().getDateJoined()}\nHabit Created - ${habit.habitCreated}',
                  // '${habit.habitName.capitalize()}  ${habit.id}',
                  // habit.habitName[0].toUpperCase() +
                  //     habit.habitName.substring(1),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                ),
              ),
            ),
          ),
          Flexible(
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
          )
        ],
      ),
    );
  }
}
