import 'package:habitapp/constants/components.dart';
import 'package:habitapp/models/habit.model.dart';

class HabitUtils {
  final List<Habit> habitList;
  HabitUtils({required this.habitList});

  // total habits in a day
  int totalHabit(List<Habit> habitList) {
    final todaysHabit = todaysHabitList(habitList);
    List<bool> totalHabit = [];
    for (var i = 0; i < todaysHabit.length; i++) {
      final temp =
          todaysHabit.elementAt(i).days.map((e) => e.name).toList().contains(
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
    final todaysHabit = todaysHabitList(habitList);
    int temp = 0;
    temp = todaysHabit
        .map((e) => e.isCompleted)
        .where((element) => element == true)
        .toList()
        .length;

    return temp;
  }

  List<Habit> todaysHabitList(List<Habit> habitList) {
    List<Habit> temp = [];
    for (var element in habitList) {
      final daysInString = element.days.asNameMap();
      if (daysInString.keys.contains(
        dateFormatter(DateTime.now()).split('-')[1].toLowerCase(),
      )) temp.add(element);
    }
    return temp;
  }

  bool isTodayHabit(int index) {
    bool temp = false;
    temp = habitList.elementAt(index).days.map((e) => e.name).toList().contains(
          dateFormatter(DateTime.now()).split('-')[1].toLowerCase(),
        );
    return temp;
  }
}

giveWeekDates() {
  final List<DateTime> weekList = [];
  final date = DateTime.now();
  print(date);
  for (var i = 0; i < 7; i++) {
    print(
      date.add(
        Duration(days: i),
      ),
    );
    weekList.add(date.add(Duration(days: i)));
  }
  print(weekList);
  return weekList;
}

extension DateTimeExtension on DateTime {
  int get weekOfMonth {
    var wom = 0;
    var date = this;

    while (date.month == month) {
      wom++;
      date = date.subtract(const Duration(days: 7));
    }

    return wom;
  }
}

timepass() {
  print(DateTime.now().day / 7);

  if (DateTime.now().weekday == DateTime.monday) {
    final List<DateTime> weekList = [];
    final date = DateTime.now();
    print(date);
    for (var i = 0; i < 7; i++) {
      print(
        date.add(
          Duration(days: i),
        ),
      );
      weekList.add(date.add(Duration(days: i)));
    }
  }else{
    
  }

}
