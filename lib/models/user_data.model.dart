// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/adapters.dart';

part 'user_data.model.g.dart';

@HiveType(typeId: 3)
class UserDataModel {
  @HiveField(0)
  DateTime? userJoined;
  @HiveField(1)
  final String? userName;
  @HiveField(2)
  final int? themeMode;
  @HiveField(3)
  final int? colorIndex;
  UserDataModel({
    DateTime? userJoined,
     this.userName,
    this.themeMode,
    this.colorIndex,
  }) : userJoined = userJoined ?? DateTime.now();

  UserDataModel copyWith({
    DateTime? userJoined,
    String? userName,
    int? themeMode,
    int? colorIndex,
  }) {
    return UserDataModel(
      userJoined: userJoined ?? this.userJoined,
      userName: userName ?? this.userName,
      themeMode: themeMode ?? this.themeMode,
      colorIndex: colorIndex ?? this.colorIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userJoined': userJoined?.millisecondsSinceEpoch,
      'userName': userName,
      'themeMode': themeMode,
      'colorIndex': colorIndex,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      userJoined: map['userJoined'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['userJoined'] as int)
          : null,
      userName: map['userName'] as String,
      themeMode: map['themeMode'] != null ? map['themeMode'] as int : null,
      colorIndex: map['colorIndex'] != null ? map['colorIndex'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataModel.fromJson(String source) =>
      UserDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
