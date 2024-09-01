import 'package:flutter/material.dart';
import 'package:policies_app/widgets/nextquestion_button.dart';
import 'package:policies_app/widgets/paragraph_container.dart';
import 'package:policies_app/widgets/question_container.dart';

class ParagraphScreen extends StatelessWidget {
  const ParagraphScreen({super.key, required this.resBody});
  final Map<String, dynamic> resBody;
  @override
  Widget build(BuildContext context) {
    var tp = resBody['headings'] as List<dynamic>;
    List<String> headings = tp.map((e) => e.toString()).toList();
    var tp2 = resBody['slugs'] as List<dynamic>;
    List<String> slugs = tp2.map((e) => e.toString()).toList();
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
        child: ParagraphContainer(headings: headings, slugs: slugs),
      ),
    );
  }
}
