import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/style/style.controller.dart';
import 'package:habitapp/widget/theme_dialog.widget.dart';

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
        ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              shape: const StadiumBorder(),
              contentPadding: const EdgeInsets.all(10),
              dense: true,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              title: Text(
                "Name",
                style: textthemeContext(context).headlineSmall,
              ),
              trailing: const Icon(Icons.edit_rounded),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const ThemeDialog(),
                );
              },
              shape: const StadiumBorder(),
              contentPadding: const EdgeInsets.all(10),
              dense: true,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              title: Text(
                "Color",
                style: textthemeContext(context).headlineSmall,
              ),
              trailing: const CircleAvatar(),
              iconColor: colorthemeContext(context).primary,
            ),
            const Divider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     ToggleButtons(
            //       borderRadius: BorderRadius.circular(10),
            //       renderBorder: true,
            //       isSelected: ref.read(selectedThemeProvider),
            //       children: const [
            //         Icon(Icons.phone_android_rounded),
            //         Icon(Icons.light_mode_rounded),
            //         Icon(Icons.dark_mode_rounded),
            //       ],
            //       onPressed: (index) {
            //         final newState = ref.watch(selectedThemeProvider);
            //         final ele =
            //             newState.firstWhere((element) => element == true);
            //         newState.insert(newState.indexOf(ele), !ele);
            //         newState.remove(ele);
            //         newState.removeAt(index);
            //         newState.insert(index, ele);
            //         ref
            //             .refresh(selectedThemeProvider.notifier)
            //             .update((state) => newState);
            //       },
            //     ),
            //   ],
            // ),
          ],
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
