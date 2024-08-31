import 'package:flutter/material.dart';

class YesNoScreen extends StatelessWidget {
  const YesNoScreen({super.key, required this.resBody});
  final Map<String, dynamic> resBody;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  resBody['value'] as String,
                  style: const TextStyle(
                      fontSize: 30,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 100,
                ),
                Text(
                  resBody['content'] as String,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
