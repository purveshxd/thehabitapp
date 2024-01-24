import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitapp/pages/addhabit.page.dart';
import 'package:habitapp/pages/summary_page.dart';
import 'package:habitapp/pages/weekly_habit.page.dart';
import 'package:habitapp/pages/settings.page.dart';
import 'package:habitapp/pages/todayshabit.page.dart';
import 'package:habitapp/style/style.controller.dart';

final currentPageProvider = StateProvider((ref) => 0);

class Homepage extends ConsumerWidget {
  Homepage({super.key});

  final pageList = <Widget>[
    const TodaysHabitPage(),
    const WeeklyHabitPage(),
    const SummaryPage(),
    SettingsPage(),
  ];
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(currentPageProvider);
    return Scaffold(
      // backgroundColor: colorthemeContext(context).background,
      appBar: appbar(context, currentPage),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
        ),
        child: PageView.builder(
          onPageChanged: (value) {
            ref.watch(currentPageProvider.notifier).update((state) => value);
          },
          controller: pageController,
          pageSnapping: true,
          allowImplicitScrolling: true,
          itemCount: pageList.length,
          itemBuilder: (context, index) {
            return pageList[index];
          },
        ),
      ),
      bottomNavigationBar: bottomNavBar(currentPage, ref),
      floatingActionButton: currentPage == 3
          ? null
          : FloatingActionButton.extended(
              label: const Text("Add Habit"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddHabitPage(),
                ));
              },
              icon: Icon(
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
        pageController.animateToPage(value,
            duration: const Duration(milliseconds: 500), curve: Curves.linear);
      },
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      destinations: const [
        NavigationDestination(
            icon: RotatedBox(
              quarterTurns: 2,
              child: Icon(Icons.view_list_rounded),
            ),
            // enabled: true,
            label: "Daily"),
        NavigationDestination(
          icon: Icon(Icons.calendar_view_week_rounded),
          label: 'Weekly',
          // enabled: true,
        ),
        NavigationDestination(
          icon: Icon(Icons.grid_view_rounded),
          label: 'All Habits',
          // enabled: true,
        ),
        NavigationDestination(
          icon: Icon(Icons.account_circle_rounded),
          label: 'Profile',
          // enabled: true,
        ),
      ],
    );
  }

  AppBar appbar(
    BuildContext context,
    int currentPage,
  ) {
    return AppBar(
      title: currentPage == 3
          ? const Text(
              "Settings",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          : Text(
              "Kaizen",
              style: GoogleFonts.josefinSans().copyWith(
                fontWeight: FontWeight.bold,
                // color: colorthemeContext(context).primary,
              ),
            ),
      actions: currentPage == 3
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
