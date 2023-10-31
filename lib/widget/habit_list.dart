import 'package:flutter/material.dart';

class HabitList extends StatelessWidget {
  const HabitList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: FilledButton.tonal(
            onPressed: () {},
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(10),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Habit-1"),
            ),
          ),
        ),
      ),
    );
  }
}
