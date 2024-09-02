import 'package:flutter/material.dart';
import 'package:policies_app/widgets/question_container.dart';

class FlowchartScreen extends StatelessWidget {
  const FlowchartScreen({super.key, required this.resBody});

  final Map<String, dynamic> resBody;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> flowchart = resBody['flowchart'] ?? [];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/background2.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: double.infinity,
        alignment: Alignment.center,
        child: QuestionContainer(flowchart: flowchart),
      ),
    );
  }
}
