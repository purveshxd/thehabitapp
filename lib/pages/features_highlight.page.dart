import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitapp/localStorage/user_storage.dart';
import 'package:habitapp/models/user_data.model.dart';
import 'package:habitapp/pages/homepage.dart';
import 'package:habitapp/style/style.controller.dart';
import 'package:habitapp/widget/text_field.widget.dart';

class FeatureHighlightScreen extends ConsumerWidget {
  FeatureHighlightScreen({super.key});
  final PageController pageController = PageController();

  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Widget> pages = [
      featureHighlight(context),
      enterNameWidget(context, textController),
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: PageView.builder(
            controller: pageController,
            itemCount: pages.length,
            itemBuilder: (context, index) => pages[index],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (pageController.page == 1) {
            if (textController.text.trim().isNotEmpty) {
              UserStorage().setUsername(textController.text.trim(),);

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Homepage(),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  showCloseIcon: true,
                  content: Text("Enter your name"),
                ),
              );
            }
          } else {
            pageController.nextPage(
                duration: const Duration(seconds: 1), curve: Curves.ease);
          }
        },
        label: const Text("Let's Go"),
      ),
    );
  }

  Column featureHighlight(BuildContext context) {
    const List<String> features = [
      'Track your habits',
      'Create new habits',
      'All this with week calendar, theming support & detailed track of habit',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Kaizen",
            style: GoogleFonts.josefinSans().copyWith(
              fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
              fontWeight: FontWeight.bold,
              color: colorthemeContext(context).primary,
            )),
        Text("Simple way to keep track of your habits and make new one",
            style: GoogleFonts.poppins().copyWith(
              fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize,
              color: colorthemeContext(context).secondary,
            )),
        const SizedBox(
          height: 8,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: features.length,
          itemBuilder: (context, index) => ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.check_circle),
            title: Text(features[index],
                style: GoogleFonts.poppins().copyWith(
                  // fontSize:
                  //     Theme.of(context).textTheme.headlineSmall!.fontSize,
                  color: colorthemeContext(context).secondary,
                )),
          ),
        ),
      ],
    );
  }

  Widget enterNameWidget(
      BuildContext context, TextEditingController textController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.timer_rounded,
          color: colorthemeContext(context).primary,
          size: MediaQuery.of(context).size.width / 7,
        ),
        const SizedBox(height: 12),
        Text("Hi, Welcome to Kaizen",
            style: GoogleFonts.josefinSans().copyWith(
              fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
              fontWeight: FontWeight.bold,
              color: colorthemeContext(context).primary,
            )),
        Text("What should we call you",
            style: GoogleFonts.poppins().copyWith(
              fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
              color: colorthemeContext(context).secondary,
            )),
        const SizedBox(height: 12),
        MyTextField(
          habitNameController: textController,
          autoFocus: false,
          hintText: "Name",
        ),
      ],
    );
  }
}
