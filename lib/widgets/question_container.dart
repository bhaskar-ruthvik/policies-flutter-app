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

  void handleAction(dynamic action) {
    if (action is int) {
      setState(() {
        index = action;
      });
    } else if (action is String) {
      if (action.toLowerCase().contains("proceed to the next question")) {
        setState(() {
          index++;
        });
      } else {
        showModal(action);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final flowchart = widget.flowchart;
    if (flowchart.isEmpty) {
      return Center(child: Text("No questions available."));
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
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 47),
                        child: Column(
                          children: [
                            Text("QUESTION ${index + 1}",
                                style: ThemeText.titleText2),
                            const SizedBox(height: 35),
                            Text(
                              flowchart[index]["question"] ??
                                  "No question available.",
                              style: ThemeText.flowchartText,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Filledbutton(
                                      onPressed: () {
                                        final yesAction =
                                            flowchart[index]["yes_action"];
                                        handleAction(yesAction);
                                      },
                                      text: 'No',
                                      buttoncolor: ThemeColours.primaryColor,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Filledbutton(
                                      onPressed: () {
                                        final noAction =
                                            flowchart[index]["no_action"];
                                        handleAction(noAction);
                                      },
                                      text: 'Yes',
                                      buttoncolor: ThemeColours.accentColor,
                                    ),
                                  ),
                                ]),
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
