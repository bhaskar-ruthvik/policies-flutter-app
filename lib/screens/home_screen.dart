import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:policies_app/screens/flowchart_screen.dart';
import 'package:policies_app/screens/paragraph_screen.dart';
import 'package:policies_app/screens/yes_no_screen.dart';
import 'package:http/http.dart' as http;
import 'package:policies_app/widgets/input_form.dart';

class Homescreen extends StatelessWidget{
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Policies"),
      ),
      body: const SafeArea(
        child: InputForm(),
      ),
    );
  }
}