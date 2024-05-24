import 'package:flutter/material.dart';
import 'package:policies_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Policies App',
      darkTheme: ThemeData.dark(
        useMaterial3: true,

      ).copyWith(
        colorScheme: ColorScheme.dark(primary: Color.fromARGB(255, 108, 218, 231))
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homescreen(),
    );
  }
}

