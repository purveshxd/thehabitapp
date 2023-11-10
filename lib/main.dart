import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/pages/todayshabit.page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepPurpleAccent,
        useMaterial3: true,
      ),
      theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
          colorSchemeSeed: Colors.deepPurpleAccent),
      home: const TodaysHabitPage(),
    );
  }
}
