// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final String id = uuid.v4();
  Habit({
    required this.habitName,
    required this.days,
    this.isCompleted = false,
  });
  // final DateTime dateCreated = DateTime.now();

  Habit copyWith({
    String? habitName,
    List<Days>? days,
    bool? isCompleted,
  }) {
    return Habit(
      habitName: habitName ?? this.habitName,
      days: days ?? this.days,
      isCompleted: isCompleted ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'habitName': habitName,
      'days': days.map((x) => x.name).toList(),
    };
  }

  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
      habitName: map['habitName'] as String,
      days: List<Days>.of(map['days']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Habit.fromJson(String source) =>
      Habit.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Habit(habitName: $habitName, days: $days)';

  @override
  bool operator ==(covariant Habit other) {
    if (identical(this, other)) return true;

    return other.habitName == habitName && listEquals(other.days, days);
  }

  @override
  int get hashCode => habitName.hashCode ^ days.hashCode;
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
