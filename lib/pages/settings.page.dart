import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/style/style.controller.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: ListView(
      children: [
        Icon(
          Icons.account_circle_rounded,
          color: colorthemeContext(context).primary,
          size: MediaQuery.of(context).size.width / 3,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text(
        //       "Account name",
        //       style: textthemeContext(context)
        //           .headlineSmall!
        //           .copyWith(fontWeight: FontWeight.bold),
        //     ),
        //   ],
        // ),
        ListTile(
          shape: const StadiumBorder(),
          contentPadding: const EdgeInsets.all(15),
          dense: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // tileColor: colorthemeContext(context).primaryContainer,
          title: Text(
            "Name",
            style: textthemeContext(context).headlineSmall,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Name of the user",
                style: textthemeContext(context).bodyMedium,
              ),
              const SizedBox(width: 10),
              const Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
        )
      ],
    ));
  }

  Widget coloredContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 400,
          color: colorthemeContext(context).secondaryContainer,
        ),
      ),
    );
  }
}
