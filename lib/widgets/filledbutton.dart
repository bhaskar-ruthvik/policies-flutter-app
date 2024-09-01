import 'package:flutter/material.dart';
import 'package:policies_app/utils.dart';

class Filledbutton extends StatelessWidget {
  final String text;
  final Color buttoncolor;
  final VoidCallback onPressed;

  const Filledbutton(
      {super.key,
      required this.text,
      required this.buttoncolor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onPressed,
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor: MaterialStateProperty.all(buttoncolor)),
    );
  }
}
