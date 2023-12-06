import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/localStorage/local_store.dart';
import 'package:habitapp/models/habit.model.dart';
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

final LocalStorage _localStorage = LocalStorage();

class _MyAppState extends State<MyApp> {
  // final _box = Hive.box('habitStorage');

  // @override
  // void initState() {
  //   if (_box.get('HABITS') == null) {
  //     _localStorage.createInitialData();
  //   } else {
  //     _localStorage.getHabitList();
  //   }
  //   super.initState();
  // }

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
      home: const TodaysHabitPage(),
    );
  }
}
