import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/models/habit.model.dart';
import 'package:habitapp/pages/homepage.dart';
import 'package:habitapp/pages/settings.page.dart';
import 'package:habitapp/widget/theme_dialog.widget.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HabitAdapter());
  Hive.registerAdapter(DaysAdapter());
  await Hive.openBox('habitStorage');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  ThemeMode setThemeMode() {
    final index = ref
        .watch(selectedThemeProvider)
        .indexWhere((element) => element == true);

    final ThemeMode themeMode = ThemeMode.values[index];
    return themeMode;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: setThemeMode(),
      darkTheme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: {TargetPlatform.android: ZoomPageTransitionsBuilder()}),
        brightness: Brightness.dark,
        colorSchemeSeed: ref.watch(currentColor),
        useMaterial3: true,
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: ref.watch(currentColor),
      ),
      home: Homepage(),
    );
  }
}
