import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'habit.model.g.dart';

const uuid = Uuid();

@HiveType(typeId: 1)
class Habit {
  @HiveField(0)
  final String habitName;
  @HiveField(1)
  final List<Days> days;
  @HiveField(2)
  final bool isCompleted;
  @HiveField(3)
  final String id;
  @HiveField(4)
  final List<DateTime> habitCompletions;
  @HiveField(5)
  final DateTime habitCreated;
  // @HiveField(6)
  // final DateTime notificationTime;
  Habit({
    required this.habitName,
    required this.habitCreated,
    required this.days,
    this.isCompleted = false,
    required this.habitCompletions,
    // required this.notificationTime,
    String? id,
  }) : id = id ?? uuid.v4();

  Habit copyWith({
    String? habitName,
    List<Days>? days,
    bool? isCompleted,
    String? id,
    List<DateTime>? habitCompletions,
    // DateTime? notificationTime,
  }) {
    return Habit(
      // notificationTime: notificationTime ?? this.notificationTime,
      habitCreated: habitCreated,
      habitCompletions: habitCompletions ?? this.habitCompletions,
      habitName: habitName ?? this.habitName,
      days: days ?? this.days,
      isCompleted: isCompleted ?? this.isCompleted,
      id: this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'habitName': habitName,
      'days': days.map((x) => x.name).toList(),
      'isCompleted': isCompleted,
    };
  }

  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
      // notificationTime: map['notificationTime'] as DateTime,
      habitCreated: map['habitCreated'] as DateTime,
      habitCompletions: map['habitCompletions'] as List<DateTime>,
      habitName: map['habitName'] as String,
      days: List<Days>.from(map['days'] as List<Days>),
      isCompleted: map['isCompleted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Habit.fromJson(String source) =>
      Habit.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Habit(habitName: $habitName, days: $days, isCompleted: $isCompleted, id: $id)';
  }

  @override
  bool operator ==(covariant Habit other) {
    if (identical(this, other)) return true;

    return other.habitName == habitName &&
        listEquals(other.days, days) &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode => habitName.hashCode ^ days.hashCode ^ isCompleted.hashCode;
}

@HiveType(typeId: 2)
enum Days {
  @HiveField(0)
  mon,
  @HiveField(1)
  tue,
  @HiveField(2)
  wed,
  @HiveField(3)
  thu,
  @HiveField(4)
  fri,
  @HiveField(5)
  sat,
  @HiveField(6)
  sun,
}
