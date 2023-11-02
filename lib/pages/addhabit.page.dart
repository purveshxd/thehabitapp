import 'package:flutter/material.dart';
import 'package:habitapp/models/habit.model.dart';

class AddHabitPage extends StatelessWidget {
  const AddHabitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Habit"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          children: [
            const TextField(
              decoration: InputDecoration(hintText: "Habit name"),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Select days",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Spacer(),
                Text(
                  "All",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Switch(
                  value: true,
                  onChanged: (value) {},
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (var day in Days.values)
                  Container(
                    // ignore: prefer_const_constructors
                    margin: EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.amber,
                    ),
                    child: Center(
                      child: Text(
                        day.name[0].toUpperCase(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
