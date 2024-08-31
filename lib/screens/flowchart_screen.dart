import 'package:flutter/material.dart';
import 'package:policies_app/widgets/question_container.dart';

class FlowchartScreen extends StatelessWidget {
  const FlowchartScreen({super.key, required this.resBody});

  final Map<String, dynamic> resBody;

  @override
  Widget build(BuildContext context) {
    final questions = resBody['questions'] ?? [];

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          alignment: Alignment.center,
          child: QuestionContainer(questions: questions),
        ),
      ),
    );
  }
}
