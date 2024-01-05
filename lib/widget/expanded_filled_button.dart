// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ExpandedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const ExpandedButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: FilledButton.tonal(
                style:
                    FilledButton.styleFrom(padding: const EdgeInsets.all(15)),
                onPressed: onPressed,
                child: Text(text)),
          )
        ],
      ),
    );
  }
}
