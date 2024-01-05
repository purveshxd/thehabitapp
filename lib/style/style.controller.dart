import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

ColorScheme colorthemeContext(context) => Theme.of(context).colorScheme;
// theme context for text
TextTheme textthemeContext(context) => Theme.of(context).textTheme;

// Selected theme Mode(Device , Light, Dark)
final selectedThemeProvider = StateProvider<List>((ref) {
  return [true, false, false];
});
