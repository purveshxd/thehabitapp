import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitapp/models/habit.model.dart';
import 'package:habitapp/models/user_data.model.dart';
import 'package:habitapp/pages/homepage.dart';
import 'package:habitapp/pages/welcome.page.dart';
import 'package:habitapp/style/style.controller.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HabitAdapter());
  Hive.registerAdapter(DaysAdapter());
  Hive.registerAdapter(UserDataModelAdapter());
  await Hive.openBox('habitStorage');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final box = Hive.box('habitStorage');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        brightness: Brightness.dark,
        colorSchemeSeed: ref.watch(currentColor),
        useMaterial3: true,
      ),
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        brightness: Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: ref.watch(currentColor),
      ),
      home: box.get('userName') == null ? const OnboardingScreen() : Homepage(),
      // home: const OnboardingScreen(),
    );
  }
}
