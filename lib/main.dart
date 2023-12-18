import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/models/habit.model.dart';
import 'package:habitapp/pages/homepage.dart';
import 'package:habitapp/pages/settings.page.dart';
import 'package:habitapp/pages/todayshabit.page.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HabitAdapter());
  Hive.registerAdapter(DaysAdapter());
  await Hive.openBox('habitStorage');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: {TargetPlatform.android: ZoomPageTransitionsBuilder()}),
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.lime,
        useMaterial3: true,
      ),
      theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
          colorSchemeSeed: Colors.deepPurpleAccent),
      home: Homepage(),
    );
  }
}
