import 'package:habitapp/constants/components.dart';
import 'package:habitapp/models/habit.model.dart';

class HabitController {
  final List habitList;
  HabitController({required this.habitList});
  // total habits in a day
  int totalHabit(List<Habit> habitList) {
    List<bool> totalHabit = [];
    for (var i = 0; i < habitList.length; i++) {
      final temp =
          habitList.elementAt(i).days.map((e) => e.name).toList().contains(
                dateFormatter(DateTime.now()).split('-')[1].toLowerCase(),
              );
      if (temp) {
        totalHabit.add(temp);
      }
    }
    return totalHabit.length;
  }

// habits completed in a day
  int completedHabit(List<Habit> habitList) {
    int temp = 0;
    temp = habitList
        .map((e) => e.isCompleted)
        .where((element) => element == true)
        .toList()
        .length;

    return temp;
  }

 
}
