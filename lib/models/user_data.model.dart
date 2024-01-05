// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/localStorage/user_local_store.dart';

// saving userData
class UserDataModel {
  final DateTime? userJoined;
  final String? userName;
  final int? themeMode;
  final int? colorIndex;
  UserDataModel({
    this.userJoined,
    this.userName,
    this.themeMode,
    this.colorIndex,
  });

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
}


