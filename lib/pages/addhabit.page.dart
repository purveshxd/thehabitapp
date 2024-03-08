import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/models/habit.model.dart';
import 'package:habitapp/controller/habit.notifier.dart';
import 'package:habitapp/widget/days_select_widget.dart';
import 'package:habitapp/widget/submit_button.dart';
import 'package:habitapp/widget/text_field.widget.dart';

final switchValueProvider = StateProvider((ref) => false);
final timeOfDayProvider = StateProvider((ref) => TimeOfDay.now());

class AddHabitPage extends ConsumerStatefulWidget {
  const AddHabitPage({super.key});

  @override
  ConsumerState<AddHabitPage> createState() => _AddHabitPageState();
}

class _AddHabitPageState extends ConsumerState<AddHabitPage> {
  // habit name controller
  final TextEditingController habitNameController = TextEditingController();
  //
  final selectedDays = [Days.mon];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create habit",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          // textfield to give habit name
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: MyTextField(
                habitNameController: habitNameController,
                autoFocus: true,
                hintText: "Habit Name"),
          ),

          // set notification Time
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       const Text(
          //         "Reminder Time",
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 18,
          //         ),
          //       ),
          //       IconButton(
          //           onPressed: () {
          //             showDialog(
          //               context: context,
          //               builder: (context) => const Dialog(
          //                 alignment: Alignment.topCenter,
          //                 // shape: StadiumBorder(),
          //                 child: Padding(
          //                   padding: EdgeInsets.all(25.0),
          //                   child: Text(
          //                       "Send's notification to remind you about the habit on selected time"),
          //                 ),
          //               ),
          //             );
          //           },
          //           icon: const Icon(Icons.info_rounded)),
          //       const Spacer(),
          //       ActionChip(
          //         label: Text(ref.watch(timeOfDayProvider).format(context)),
          //         shape: const StadiumBorder(),
          //         side: BorderSide.none,
          //         backgroundColor: colorthemeContext(context).primaryContainer,
          //         onPressed: () {
          //           showTimePicker(
          //             context: context,
          //             initialTime: ref.watch(timeOfDayProvider),
          //           ).then((value) => ref
          //               .watch(timeOfDayProvider.notifier)
          //               .update((state) => value!));
          //         },
          //       )
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Select Days",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                // toggle all days selection
                Switch(
                  value: ref.watch(switchValueProvider),
                  onChanged: (value) {
                    ref
                        .read(switchValueProvider.notifier)
                        .update((state) => value);
                    if (ref.watch(switchValueProvider)) {
                      selectedDays.clear();
                      selectedDays.addAll(Days.values);
                    } else {
                      selectedDays.clear();
                      selectedDays.add(Days.mon);
                    }
                  },
                )
              ],
            ),
          ),

// weekday selection widget
          DaysSelectWidget(
            selectedDays: selectedDays,
            switchValue: ref.watch(switchValueProvider),
          ),

// submit button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
            child: SubmitButton(
              onPressed: () {
                if (habitNameController.text.trim().isNotEmpty) {
                  ref.watch(habitStateNotifierProvider.notifier).addHabit(
                        Habit(
                          // notificationTime: ref.watch(timeOfDayProvider),
                          habitName: habitNameController.text.trim(),
                          days: selectedDays,
                          habitCreated: DateTime.now(),
                          habitCompletions: [],
                        ),
                      );
                  Navigator.pop(context);
                  ref
                      .watch(switchValueProvider.notifier)
                      .update((state) => false);

                  ref
                      .watch(timeOfDayProvider.notifier)
                      .update((state) => TimeOfDay.now());
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Enter habit"),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
