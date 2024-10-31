import 'package:flutter/material.dart';
import 'package:policies_app/utils.dart';
import 'package:policies_app/widgets/custom_modal.dart';
import 'package:policies_app/widgets/filledbutton.dart';
import 'package:policies_app/widgets/nextquestion_button.dart';

class QuestionContainer extends StatefulWidget {
  const QuestionContainer({super.key, required this.flowchart});

  final List<dynamic> flowchart;

  @override
  State<QuestionContainer> createState() => _QuestionState();
}

class _QuestionState extends State<QuestionContainer> {
  int index = 0;

  void showModal(String info) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return CustomModal(info: info);
      },
    );
  }

  void showModal2(String info) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return CustomModal(info: info);
      },
    );
  }

  String? currentActionText; // State variable to store the current action text

  void handleAction(dynamic action) {
    if (action is int) {
      setState(() {
        index = action;
        currentActionText =
            null; // Clear the action text when moving to a new question
      });
    } else if (action is String) {
      if (action.toLowerCase().contains("proceed to the next question")) {
        setState(() {
          index++;
          currentActionText =
              null; // Clear the action text when moving to the next question
        });
      } else {
        setState(() {
          currentActionText =
              action; // Update the action text to display it on the card
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final flowchart = widget.flowchart;
    if (flowchart.isEmpty) {
      return const Center(child: Text("No questions available."));
    }
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 30),
                        child: Column(
                          children: [
                            currentActionText == null && index == 0
                                ? Text(
                                    "QUESTION ${index + 1}",
                                    style: ThemeText.titleText2,
                                  )
                                : currentActionText == null && index != 0
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                              padding: const EdgeInsets.all(0),
                                              onPressed: () {
                                                setState(() {
                                                  index--;
                                                });
                                              },
                                              icon: const Icon(
                                                  size: 20,
                                                  Icons.arrow_back_ios,
                                                  color: ThemeColours
                                                      .secondaryColor)),
                                          Text(
                                            "QUESTION ${index + 1}",
                                            style: ThemeText.titleText2,
                                          ),
                                          const SizedBox(width: 40),
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          IconButton(
                                              padding: const EdgeInsets.all(0),
                                              onPressed: () {
                                                setState(() {
                                                  currentActionText = null;
                                                });
                                              },
                                              icon: const Icon(
                                                  Icons.arrow_back_ios,
                                                  color: ThemeColours
                                                      .secondaryColor)),
                                        ],
                                      ),
                            const SizedBox(height: 20),
                            Text(
                              currentActionText ??
                                  flowchart[index]["question"] ??
                                  "No question available.",
                              style: ThemeText.flowchartText,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            currentActionText == null
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Expanded(
                                          child: Filledbutton(
                                            onPressed: () {
                                              final noAction =
                                                  flowchart[index]["no_action"];
                                              handleAction(noAction);
                                            },
                                            text: 'No',
                                            buttoncolor:
                                                ThemeColours.primaryColor,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Filledbutton(
                                            onPressed: () {
                                              final yesAction = flowchart[index]
                                                  ["yes_action"];
                                              handleAction(yesAction);
                                            },
                                            text: 'Yes',
                                            buttoncolor:
                                                ThemeColours.accentColor,
                                          ),
                                        ),
                                      ])
                                : index < flowchart.length - 1
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                            Expanded(
                                              child: Filledbutton(
                                                onPressed: () {
                                                  setState(() {
                                                    index++;
                                                    currentActionText =
                                                        null; // Clear the action text when moving to the next question
                                                  });
                                                },
                                                text: 'See Next Question',
                                                buttoncolor:
                                                    ThemeColours.accentColor,
                                              ),
                                            ),
                                          ])
                                    : SizedBox(height: 10),
                          ],
                        ))),
                const SizedBox(height: 20),
                const NextQuestionButton(),
              ],
            ),
          )
        ]);
  }
}
