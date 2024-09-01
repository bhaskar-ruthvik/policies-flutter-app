import 'package:flutter/material.dart';
import 'package:policies_app/models/Response.dart';
import 'package:policies_app/screens/flowchart_screen.dart';
import 'package:policies_app/screens/paragraph_screen.dart';
import 'package:policies_app/screens/yes_no_screen.dart';

class AnswerScreen extends StatelessWidget {
  const AnswerScreen({super.key, required this.res});

  final CustomResponse res;

  @override
  Widget build(BuildContext context) {
    return res.type == "Yes/No Question"
        ? YesNoScreen(resBody: res.body)
        : res.type == "Informative Paragraph Question" //make default
            ? ParagraphScreen(resBody: res.body)
            : FlowchartScreen(resBody: res.body);
  }
}
