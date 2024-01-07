import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitapp/pages/features_highlight.page.dart';
import 'package:habitapp/style/style.controller.dart';
import 'package:habitapp/widget/expanded_filled_button.dart';
import 'package:metaballs/dart_ui_real.dart';
import 'package:metaballs/metaballs.dart';

final currentPageProvider = StateProvider<int>((ref) {
  return 0;
});

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});
  final double blurPer = 25;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // PageController pageController = PageController();

    return Scaffold(
      body: SafeArea(
        child: Metaballs(
          effect: MetaballsEffect.grow(
            growthFactor: 1,
            smoothing: 1,
            radius: 1,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              colorthemeContext(context).primary,
              colorthemeContext(context).primaryContainer,
              colorthemeContext(context).secondary,
              colorthemeContext(context).secondaryContainer,
            ],
          ),
          metaballs: 30,
          animationDuration: const Duration(milliseconds: 1000),
          speedMultiplier: 1,
          bounceStiffness: 3,
          minBallRadius: 30,
          maxBallRadius: 60,
          glowRadius: 0,
          glowIntensity: 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blurPer, sigmaY: blurPer),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  // color: Colors.grey.withOpacity(.),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Kaizen",
                          style: GoogleFonts.josefinSans().copyWith(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: colorthemeContext(context).primary,
                          )),
                      const SizedBox(height: 5),
                      // Text(
                      //   "/kʌɪzn,kʌɪzɛn/",
                      //   style: GoogleFonts.poppins(
                      //       fontSize: Theme.of(context)
                      //           .textTheme
                      //           .headlineSmall!
                      //           .fontSize,
                      //       color: colorthemeContext(context).secondary),
                      //   // Theme.of(context).textTheme.headlineSmall!.copyWith(
                      //   //       color: colorthemeContext(context).secondary,
                      //   //     ),
                      // ),
                      // const SizedBox(height: 5),
                      Text(
                        "A Japanese business philosophy of continuous improvement of working practices, personal efficiency, etc.",
                        style: GoogleFonts.poppins(
                            color: colorthemeContext(context).onBackground,
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .fontSize),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              ExpandedButton(
                text: "Get Started",
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeatureHighlightScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
