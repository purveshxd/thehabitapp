import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/style/style.controller.dart';
import 'package:habitapp/widget/theme_dialog.widget.dart';

class SettingsPage extends ConsumerWidget {
  SettingsPage({super.key});

  final List items = [
    ["Name", const Icon(Icons.mode_edit_rounded)],
    ["Theme", const Icon(Icons.palette_rounded)],
    ["Large Fab Button", const Icon(Icons.add_box_rounded)]
  ];
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
        ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => const Divider(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              if (index == 1) {
                return ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => const ThemeDialog());
                  },
                  shape: const StadiumBorder(),
                  contentPadding: const EdgeInsets.all(10),
                  dense: true,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  // tileColor: colorthemeContext(context).primaryContainer,
                  title: Text(
                    items[index][0],
                    style: textthemeContext(context).headlineSmall,
                  ),
                  trailing: const CircleAvatar(),
                  iconColor: colorthemeContext(context).primary,
                );
              }
              return ListTile(
                shape: const StadiumBorder(),
                contentPadding: const EdgeInsets.all(10),
                dense: true,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                // tileColor: colorthemeContext(context).primaryContainer,
                title: Text(
                  items[index][0],
                  style: textthemeContext(context).headlineSmall,
                ),
                trailing: items[index][1],
              );
            })
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
