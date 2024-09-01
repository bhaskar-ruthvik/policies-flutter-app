import 'package:flutter/material.dart';
import 'package:policies_app/utils.dart';
import 'package:policies_app/widgets/nextquestion_button.dart';

class YesNoScreen extends StatelessWidget {
  const YesNoScreen({super.key, required this.resBody});
  final Map<String, dynamic> resBody;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/background2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
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
                          horizontal: 30, vertical: 47),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(resBody['value'] as String,
                              style: ThemeText.yesNoText),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            resBody['content'] as String,
                            style: ThemeText.bodyText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const NextQuestionButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
