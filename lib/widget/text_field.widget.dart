import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController habitNameController;
  const MyTextField({
    super.key,
    required this.habitNameController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: habitNameController,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: "Habit Name",
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
