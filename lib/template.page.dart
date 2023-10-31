import 'package:flutter/material.dart';
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
        actions: [
          IconButton(
            iconSize: MediaQuery.of(context).size.shortestSide / 14,
            onPressed: null,
            icon: Icon(
              Icons.add_rounded,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ],
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
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: Container(
      //   decoration: BoxDecoration(
      //     boxShadow: const [
      //       BoxShadow(
      //           blurRadius: 5,
      //           blurStyle: BlurStyle.outer,
      //           offset: Offset(0, 0),
      //           color: Colors.grey),
      //     ],
      //     borderRadius: BorderRadius.circular(15),
      //     color: checkBrightness(
      //       Colors.grey.shade900,
      //       Theme.of(context).colorScheme.secondaryContainer,
      //     ),
      //   ),
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      //     child: Row(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         IconButton.filled(
      //           onPressed: () {},
      //           style: FilledButton.styleFrom(
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(15),
      //             ),
      //             padding: const EdgeInsets.all(10),
      //           ),
      //           icon: const Icon(Icons.view_agenda_rounded),
      //         ),
      //         IconButton.filled(
      //           onPressed: () {},
      //           style: FilledButton.styleFrom(
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(15),
      //             ),
      //             padding: const EdgeInsets.all(10),
      //           ),
      //           icon: const Icon(Icons.view_week_rounded),
      //         ),
      //         IconButton.filled(
      //           onPressed: () {},
      //           style: FilledButton.styleFrom(
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(15),
      //             ),
      //             padding: const EdgeInsets.all(10),
      //           ),
      //           icon: const Icon(
      //             Icons.view_compact_rounded,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
