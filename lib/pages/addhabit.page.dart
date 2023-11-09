import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/models/habit.model.dart';
import 'package:habitapp/widget/days_select_widget.dart';
import 'package:habitapp/widget/submit_button.dart';
import 'package:habitapp/widget/text_field.widget.dart';

// final selectedDaysProvider = StateProvider<List<Days>>((ref) => [Days.mon]);
final switchValueProvider = StateProvider((ref) => false);

class AddHabitPage extends ConsumerStatefulWidget {
  const AddHabitPage({super.key});

  @override
  ConsumerState<AddHabitPage> createState() => _AddHabitPageState();
}

class _AddHabitPageState extends ConsumerState<AddHabitPage> {
  // habit name controller
  final TextEditingController habitNameController = TextEditingController();

  final selectedDays = [Days.mon];

  // final switchValue = false;
  @override
  Widget build(BuildContext context) {
    // List<Days> selectedDays = ref.watch(selectedDaysProvider);
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Create habit",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      body: ListView(
        children: [
          // textfield to give habit name
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: MyTextField(habitNameController: habitNameController),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Select Days",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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

          DaysSelectWidget(
            selectedDays: selectedDays,
            switchValue: ref.watch(switchValueProvider),
          ),

// submit button
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SubmitButton(
              onPressed: () {
                // HabitList().addHabit(Habit(habitName: habitNameController.text, days: [days]))
              },
            ),
          )
        ],
      ),
    );
  }
}
