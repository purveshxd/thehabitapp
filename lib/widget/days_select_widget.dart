import 'package:flutter/material.dart';
import 'package:habitapp/models/habit.model.dart';

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
    bool isSelected(int index) {
      if (widget.selectedDays.contains(Days.values[index])) {
        return true;
      } else {
        return false;
      }
    }

    void selectDays(Days day) {
      setState(() {
        if (widget.switchValue) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 1),
              content: Text("Turn off switch"),
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
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10, childAspectRatio: 1, crossAxisCount: 7),
          itemCount: Days.values.length,
          itemBuilder: (context, index) {
            return OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: isSelected(index)
                    ? BorderSide(
                        color: Theme.of(context).colorScheme.outline, width: 2)
                    : BorderSide.none,
                padding: const EdgeInsets.all(0),
                backgroundColor: isSelected(index)
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.secondaryContainer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              // elevation: 0,
              // fillColor: Theme.of(context).colorScheme.secondaryContainer,

              onPressed: () {
                selectDays(Days.values[index]);
              },
              child: Center(
                child: Text(Days.values[index].name[0].toUpperCase(),
                    textAlign: TextAlign.center,
                    style: isSelected(index)
                        ? TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer)
                        : TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer)),
              ),
            );
          }),
    );
  }
}

// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
