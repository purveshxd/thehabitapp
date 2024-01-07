import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/controller/userdata.notifier.dart';
import 'package:habitapp/localStorage/user_storage.dart';
import 'package:habitapp/models/user_data.model.dart';
import 'package:habitapp/style/style.controller.dart';
import 'package:habitapp/widget/text_field.widget.dart';
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
          style: const TextStyle(fontSize: 25),
        ),
        ListView(
          // ListTile(
          //   onTap: () {
          //     //   showDialog(
          //     //     context: context,
          //     //     builder: (context) => AlertDialog(
          //     //         title: const Text("Change username"),
          //     //         content: MyTextField(
          //     //             habitNameController: textController,
          //     //             hintText: "Name",
          //     //             autoFocus: true),
          //     //         actions: [
          //     //           FilledButton(
          //     //             onPressed: () {
          //     //               if (textController.text.trim().isNotEmpty) {
          //     //                 UserStorage().saveData(
          //     //                   UserDataModel(
          //     //                     userName: textController.text.trim(),
          //     //                   ),
          //     //                 );
          //     //                 Navigator.pop(context);
          //     //               } else {
          //     //                 ScaffoldMessenger.of(context).showSnackBar(
          //     //                   const SnackBar(
          //     //                     content: Text("Enter name"),
          //     //                   ),
          //     //                 );
          //     //               }
          //     //             },
          //     //             child: const Text("Save"),
          //     //           )
          //     //         ]),
          //     //   );
          //   },
          //   shape: const StadiumBorder(),
          //   contentPadding: const EdgeInsets.all(10),
          //   dense: true,
          //   visualDensity: VisualDensity.adaptivePlatformDensity,
          //   title: Text(
          //     getUsername(),
          //     style: textthemeContext(context).headlineSmall,
          //   ),
          //   // trailing: const Icon(Icons.edit_rounded),
          // ),
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
        ),
        const Spacer(),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Made in "),
            FlutterLogo(
                style: FlutterLogoStyle.horizontal,
                size: MediaQuery.of(context).size.width / 8,
                textColor: colorthemeContext(context).onBackground),
            const Text(" with ♥️😍🎉🤩😱🎊🥳")
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
