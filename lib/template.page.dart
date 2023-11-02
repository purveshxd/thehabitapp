import 'package:flutter/material.dart';
import 'package:habitapp/pages/addhabit.page.dart';
import 'package:habitapp/pages/todayshabit.page.dart';
import 'package:habitapp/pages/weeklyhabit.view.dart';

class HabitPageTemplate extends StatelessWidget {
  const HabitPageTemplate({super.key});

  @override
  Widget build(BuildContext context) {
//  tells the current brightness
    Color checkBrightness(Color darkColor, Color lightColor) {
      return Theme.of(context).brightness == Brightness.dark
          ? darkColor
          : lightColor;
    }

    return Scaffold(
        extendBodyBehindAppBar: false,
        extendBody: false,
        backgroundColor: checkBrightness(
            Colors.black, Theme.of(context).colorScheme.background),
        appBar: AppBar(
          forceMaterialTransparency: true,
          leading: IconButton(
            icon: const Icon(Icons.grid_view_rounded),
            iconSize: MediaQuery.of(context).size.shortestSide / 14,
            onPressed: () {},
          ),
        ),
        body: PageView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            if (index == 1) {
              return const WeeklyHabitPage();
            } else {
              return const TodaysHabitPage();
            }
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddHabitPage(),
                ));
          },
          label: const Text("Add"),
          icon: const Icon(Icons.add_rounded),
        ));
  }
}
