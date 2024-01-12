import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/constants/constants.dart';
import 'package:habitapp/style/style.controller.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DeveloperPage extends ConsumerWidget {
  const DeveloperPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Purveshxd"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // shrinkWrap: true,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(35),
              itemCount: socialList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
              itemBuilder: (context, index) => IconButton.filledTonal(
                style: IconButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                onPressed: () {
                  launchUrlString(
                    socialList[index][2],
                    mode: LaunchMode.externalApplication,
                  );
                },
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      socialList[index][1],
                      scale: 12,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      socialList[index][0],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            ActionChip(
              label: const Text("Portfolio"),
              side: BorderSide.none,
              avatar: const Icon(Icons.web_rounded),
              shape: const StadiumBorder(),
              backgroundColor: colorthemeContext(context).secondaryContainer,
              onPressed: () {
                launchUrlString(
                  portfolio,
                  mode: LaunchMode.externalApplication,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
