import 'package:flutter/material.dart';
import 'package:habitapp/template.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.amberAccent,
        useMaterial3: true,
      ),
      theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
          colorSchemeSeed: Colors.purpleAccent),
      home: const HabitPageTemplate(),
    );
  }
}
