import 'package:flutter/material.dart';

class DailyProgressWidget extends StatelessWidget {
  const DailyProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: TextSpan(
                text: "Today's",
                style: Theme.of(context).textTheme.headlineLarge,
                children: [
                  TextSpan(
                    text: " Habits",
                    style: (Theme.of(context).textTheme.headlineLarge)!.merge(
                      const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.shortestSide / 2,
            //   child: LinearProgressIndicator(
            //     minHeight: 8,
            //     borderRadius: BorderRadius.circular(15),
            //     value: .2,
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            Text("0 of 2 completed",
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox.square(
            dimension: 100,
            child: CircularProgressIndicator(
              value: .7,
              strokeCap: StrokeCap.round,
              strokeWidth: 8,
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            ),
          ),
        ),
      ],
    );
  }
}
