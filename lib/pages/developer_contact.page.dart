import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/constants/constants.dart';
import 'package:habitapp/style/style.controller.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperContactPage extends ConsumerWidget {
  const DeveloperContactPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DeveloperData dev = DeveloperData();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Purveshxd"),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GridView.builder(
              shrinkWrap: true,
              itemCount: dev.socialList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              padding: const EdgeInsets.all(30),
              itemBuilder: (context, index) => Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      dev.socialList[index][1],
                      scale: 14,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      dev.socialList[index][0],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            ActionChip(
              label: const Text("Portfolio Website"),
              shape: const StadiumBorder(),
              backgroundColor: colorthemeContext(context).secondaryContainer,
              side: BorderSide.none,
              // avatar: Icon(Icon),
              onPressed: () {
                launchUrl(Uri.parse(dev.webSite),
                    mode: LaunchMode.externalApplication);
              },
            )
          ],
        ),
      ),
      // body: ListView.separated(
      //   separatorBuilder: (context, index) => const Divider(),
      //   shrinkWrap: true,
      //   itemCount: dev.socialList.length,
      //   itemBuilder: (context, index) => Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: ListTile(
      //       onTap: () {
      //         launchUrl(
      //             Uri.parse(
      //               dev.socialList[index][2],
      //             ),
      //             mode: LaunchMode.externalApplication);
      //       },
      //       shape: const RoundedRectangleBorder(
      //         borderRadius: BorderRadius.all(
      //           Radius.circular(8),
      //         ),
      //       ),
      //       // tileColor: colorthemeContext(context).secondaryContainer,
      //       title: Text(
      //         dev.socialList[index][0],
      //         style: const TextStyle(fontWeight: FontWeight.bold),
      //       ),
      //       trailing: Image.asset(
      //         dev.socialList[index][1],
      //         scale: 14,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
