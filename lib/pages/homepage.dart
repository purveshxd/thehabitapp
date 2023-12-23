import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/pages/addhabit.page.dart';
import 'package:habitapp/pages/all_habits.page.dart';
import 'package:habitapp/pages/settings.page.dart';
import 'package:habitapp/pages/todayshabit.page.dart';
import 'package:habitapp/style/style.controller.dart';
import 'package:intl/intl.dart';

final currentPageProvider = StateProvider((ref) => 0);

class Homepage extends ConsumerWidget {
  Homepage({super.key});

  final pageList = [
    const TodaysHabitPage(),
    const AllHabitsPage(),
    const SettingsPage()
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(currentPageProvider);
    return Scaffold(
      appBar: appbar(context, currentPage),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: pageList[currentPage],
      ),
      bottomNavigationBar: bottomNavBar(currentPage, ref),
      floatingActionButton: currentPage == 2
          ? null
          : FloatingActionButton.large(
            
              // backgroundColor: colorthemeContext(context).primary,
              onPressed: () {
                final date = DateTime.now();
                print(DateFormat('y-M-dd').format(date));
                // print(habitsTemp[0].habitCompletions);

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddHabitPage(),
                ));
              },
              child: Icon(
                Icons.add_rounded,
                color: colorthemeContext(context).onSecondaryContainer,
                size: MediaQuery.of(context).size.shortestSide / 14,
              ),
            ),
    );
  }

  NavigationBar bottomNavBar(int currentPage, WidgetRef ref) {
    return NavigationBar(
      selectedIndex: currentPage,
      onDestinationSelected: (value) {
        ref.watch(currentPageProvider.notifier).update((state) => value);
      },
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      destinations: const [
        NavigationDestination(
            icon: RotatedBox(
              quarterTurns: 2,
              child: Icon(Icons.view_list_rounded),
            ),
            enabled: true,
            label: "Daily"),
        NavigationDestination(
            icon: Icon(Icons.splitscreen_rounded),
            label: 'Habits',
            enabled: true),
        NavigationDestination(
            icon: Icon(Icons.settings_rounded),
            label: 'Settings',
            enabled: true),
      ],
    );
  }

  AppBar appbar(
    BuildContext context,
    int currentPage,
  ) {
    return AppBar(
      title: Text(
        currentPage == 2 ? "Settings" : "h-bit",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: currentPage == 2
          ? null
          : [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton.filledTonal(
                  padding: const EdgeInsets.all(0),
                  iconSize: MediaQuery.of(context).size.shortestSide / 14,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddHabitPage(),
                    ));
                  },
                  icon: Icon(
                    Icons.add_rounded,
                    color: colorthemeContext(context).onBackground,
                  ),
                ),
              ),
            ],
      forceMaterialTransparency: true,
    );
  }
}
