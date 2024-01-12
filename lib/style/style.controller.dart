import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/localStorage/user_storage.dart';

ColorScheme colorthemeContext(context) => Theme.of(context).colorScheme;
// theme context for text
TextTheme textthemeContext(context) => Theme.of(context).textTheme;

// Selected theme Mode(Device , Light, Dark)
final selectedThemeProvider = StateProvider<List>((ref) {
  return [true, false, false];
});

final currentColor = StateProvider((ref) {
  return materialColors[UserStorage().getColor()];
});

List<Color> materialColors = Colors.primaries;
