// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitAdapter extends TypeAdapter<Habit> {
  @override
  final int typeId = 1;

  @override
  Habit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Habit(
      habitName: fields[0] as String,
      days: (fields[1] as List).cast<Days>(),
      isCompleted: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Habit obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.habitName)
      ..writeByte(1)
      ..write(obj.days)
      ..writeByte(2)
      ..write(obj.isCompleted)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DaysAdapter extends TypeAdapter<Days> {
  @override
  final int typeId = 2;

  @override
  Days read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Days.mon;
      case 1:
        return Days.tue;
      case 2:
        return Days.wed;
      case 3:
        return Days.thu;
      case 4:
        return Days.fri;
      case 5:
        return Days.sat;
      case 6:
        return Days.sun;
      default:
        return Days.mon;
    }
  }

  @override
  void write(BinaryWriter writer, Days obj) {
    switch (obj) {
      case Days.mon:
        writer.writeByte(0);
        break;
      case Days.tue:
        writer.writeByte(1);
        break;
      case Days.wed:
        writer.writeByte(2);
        break;
      case Days.thu:
        writer.writeByte(3);
        break;
      case Days.fri:
        writer.writeByte(4);
        break;
      case Days.sat:
        writer.writeByte(5);
        break;
      case Days.sun:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DaysAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
