// import 'package:flutter/material.dart';
// import 'package:habitapp/pages/addhabit.page.dart';
// import 'package:habitapp/pages/todayshabit.page.dart';
// import 'package:habitapp/pages/weeklyhabit.view.dart';

// class HabitHomepage extends StatelessWidget {
//   const HabitHomepage({super.key});

//   @override
//   Widget build(BuildContext context) {
// // pagelist
//     final List<Widget> pageList = [
//       const TodaysHabitPage(),
//       const WeeklyHabitPage()
//     ];

// //  tells the current brightness
//     Color checkBrightness(Color darkColor, Color lightColor) {
//       return Theme.of(context).brightness == Brightness.dark
//           ? darkColor
//           : lightColor;
//     }

//     return Scaffold(
//       extendBodyBehindAppBar: false,
//       extendBody: false,
//       backgroundColor: checkBrightness(
//           Colors.black, Theme.of(context).colorScheme.background),
//       appBar: AppBar(
//         // backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
//         title: const Text(
//           "h-bit",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         forceMaterialTransparency: true,
//         actions: [
//           IconButton(
//             iconSize: MediaQuery.of(context).size.shortestSide / 14,
//             onPressed: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => const AddHabitPage(),
//               ));
//             },
//             icon: Icon(
//               Icons.add_rounded,
//               color: Theme.of(context).colorScheme.onBackground,
//             ),
//           ),
//         ],
//       ),
//       body: PageView.builder(
//         itemCount: pageList.length,
//         itemBuilder: (context, index) {
//           return pageList[index];
//         },
//       ),
//     );
//   }
// }
