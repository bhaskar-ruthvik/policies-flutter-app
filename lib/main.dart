import 'package:flutter/material.dart';
import 'package:policies_app/screens/flowchart_screen.dart';
import 'package:policies_app/screens/home_screen.dart';
import 'package:policies_app/screens/paragraph_screen.dart';
import 'package:policies_app/screens/yes_no_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Policies App',
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(colorScheme: ColorScheme.dark(primary: Color(0xFF424A5F))),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homescreen(),
    );
  }
}
