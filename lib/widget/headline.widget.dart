import 'package:flutter/material.dart';

class PageHeadline extends StatelessWidget {
  const PageHeadline({
    super.key,
    required this.headlineText,
  });
  final String headlineText;

  @override
  Widget build(BuildContext context) {
    final headline = headlineText.split(" ");

    debugPrint(headline.first);
    return RichText(
      text: TextSpan(
        text: headline.first,
        style: (Theme.of(context).textTheme.headlineMedium)!.merge(
          const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          TextSpan(
            text: " ${headline.last}",
            // style: (Theme.of(context).textTheme.headlineMedium)!.merge(
            //   const TextStyle(fontWeight: FontWeight.bold),
            // ),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
