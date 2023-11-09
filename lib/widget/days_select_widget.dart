import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/models/habit.model.dart';
import 'package:habitapp/pages/addhabit.page.dart';

class DaysSelectWidget extends StatefulWidget {
  final List<Days> selectedDays;
  final bool switchValue;
  const DaysSelectWidget({
    super.key,
    required this.selectedDays,
    required this.switchValue,
  });

  @override
  State<DaysSelectWidget> createState() => _DaysSelectWidgetState();
}

// final selectedDays = [Days.mon];

class _DaysSelectWidgetState extends State<DaysSelectWidget> {
  @override
  Widget build(BuildContext context) {
    TextStyle? isSelected(int index) {
      if (widget.selectedDays.contains(Days.values[index])) {
        return const TextStyle(fontWeight: FontWeight.bold, color: Colors.red);
      } else {
        return null;
      }
    }

    void selectDays(Days day) {
      setState(() {
        if (widget.switchValue) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 1),
              content: Text("Can't select days"),
            ),
          );
        } else {
          if (widget.selectedDays.contains(day)) {
            widget.selectedDays.remove(day);
          } else {
            widget.selectedDays.add(day);
          }
        }
      });

      print(widget.selectedDays);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 5, childAspectRatio: 5 / 4, crossAxisCount: 7),
          itemCount: Days.values.length,
          itemBuilder: (context, index) {
            return RawMaterialButton(
              fillColor: Theme.of(context).colorScheme.secondaryContainer,
              onPressed: () {
                selectDays(Days.values[index]);
              },
              child: Text(
                Days.values[index].name[0].toUpperCase(),
                style: isSelected(index),
              ),
            );
          }),
    );
  }
}

// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
