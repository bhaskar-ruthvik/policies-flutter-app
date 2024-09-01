import 'package:flutter/material.dart';
import 'package:policies_app/utils.dart';
import 'package:policies_app/widgets/filledbutton.dart';
import 'package:policies_app/widgets/nextquestion_button.dart';

class ParagraphContainer extends StatefulWidget {
  const ParagraphContainer(
      {super.key, required this.headings, required this.slugs});

  final List<String> headings;
  final List<String> slugs;

  @override
  State<ParagraphContainer> createState() => _ParagraphState();
}

class _ParagraphState extends State<ParagraphContainer> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final headings = widget.headings;
    final paragraphs = widget.slugs;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Card(
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 47),
                  child: Column(
                    children: [
                      Text(
                        'STEP ${index + 1}',
                        style: ThemeText.titleText2,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        headings[index],
                        style: ThemeText.titleText,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        paragraphs[index],
                        style: ThemeText.bodyText,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(height: 40),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          index == 0
                              ? SizedBox()
                              : Expanded(
                                  child: Filledbutton(
                                  text: "Previous",
                                  buttoncolor: index == 0
                                      ? Colors.white
                                      : ThemeColours.primaryColor,
                                  onPressed: () {
                                    setState(() {
                                      if (index > 0) {
                                        index--;
                                      }
                                    });
                                  },
                                )),
                          const SizedBox(
                            width: 10,
                          ),
                          index == headings.length - 1
                              ? const SizedBox()
                              : Expanded(
                                  child: Filledbutton(
                                  buttoncolor: index == headings.length - 1
                                      ? Colors.white
                                      : ThemeColours.accentColor,
                                  text: "Next",
                                  onPressed: () {
                                    setState(() {
                                      if (index < headings.length - 1) {
                                        index++;
                                      }
                                    });
                                  },
                                ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const NextQuestionButton()
            ],
          ),
        )
      ],
    );
  }
}
