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
    return RichText(
      text: TextSpan(
        text: headline[0],
        style: Theme.of(context).textTheme.headlineLarge,
        children: [
          TextSpan(
            text: " ${headline[1]}",
            style: (Theme.of(context).textTheme.headlineLarge)!.merge(
              const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
