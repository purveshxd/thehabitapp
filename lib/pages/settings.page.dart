import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/localStorage/user_storage.dart';
import 'package:habitapp/pages/developer.page.dart';
import 'package:habitapp/style/style.controller.dart';
import 'package:habitapp/widget/theme_dialog.widget.dart';

class SettingsPage extends ConsumerWidget {
  SettingsPage({super.key});
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String getUsername() {
      return UserStorage().getUsername();
    }

    return Scaffold(
      body: Column(
        children: [
          Icon(
            Icons.account_circle_rounded,
            color: colorthemeContext(context).primary,
            size: MediaQuery.of(context).size.width / 3,
          ),
          Text(
            getUsername(),
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(height: 10),
              const Divider(),
              ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ThemeDialog(),
                  );
                },
                contentPadding: const EdgeInsets.all(10),
                dense: true,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                title: Text(
                  "Theme Color",
                  style: textthemeContext(context).headlineSmall,
                ),
                trailing:
                    CircleAvatar(backgroundColor: ref.watch(currentColor)),
              ),
              const Divider(),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DeveloperPage(),
                      ));
                },
                shape: const StadiumBorder(),
                contentPadding: const EdgeInsets.all(10),
                dense: true,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                title: Text(
                  "Developer",
                  style: textthemeContext(context).headlineSmall,
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ],
          ),
        ],
      ),
    );
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
