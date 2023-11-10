// import 'package:flutter/material.dart';
// import 'package:habitapp/widget/weekly_calendar.dart';

// class WeeklyHabitPage extends StatelessWidget {
//   const WeeklyHabitPage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 18.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           RichText(
//             text: TextSpan(
//               text: "Weekly",
//               style: Theme.of(context).textTheme.headlineLarge,
//               children: [
//                 TextSpan(
//                   text: " Habits",
//                   style: (Theme.of(context).textTheme.headlineLarge)!.merge(
//                     const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 15),
//           const WeeklyCalendar(),
//           const SizedBox(height: 15),
//           // const HabitList(),
//         ],
//       ),
//     );
//   }
// }
