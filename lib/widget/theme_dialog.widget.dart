import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/constants/components.dart';
import 'package:habitapp/style/style.controller.dart';

final currentColor = StateProvider((ref) => materialColors[1]);

class ThemeDialog extends ConsumerWidget {
  const ThemeDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Dialog(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height / 2,
        child: Padding(
          padding: const EdgeInsets.all(20.0).copyWith(top: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Select color",
                  style: textthemeContext(context)
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                  // style: Style(context: context)
                  //     .sectionHeading()
                  //     .copyWith(fontSize: MediaQuery.of(context).size.width / 35),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GridView.builder(
                  // padding: const EdgeInsets.all(20),
                  shrinkWrap: true,
                  itemCount: materialColors.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 5,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        ref.watch(currentColor.notifier).update(
                              (state) => materialColors.elementAt(index),
                            );
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: ref.watch(currentColor) ==
                                    materialColors.elementAt(index)
                                ? Border.all(
                                    width: 2,
                                    color: colorthemeContext(context).tertiary)
                                : null,
                            color: materialColors.elementAt(index),
                          ),
                          child: ref.watch(currentColor) ==
                                  materialColors.elementAt(index)
                              ? Icon(
                                  Icons.check_circle_rounded,
                                  color: colorthemeContext(context).tertiary,
                                )
                              : null),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
