import 'package:flutter/material.dart';
import 'package:policies_app/utils.dart';

class Outlinedbutton extends StatelessWidget {
  final VoidCallback onPressed;
  const Outlinedbutton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
        child: Text(
          'Next Question',
          style: TextStyle(
            color: ThemeColours.secondaryColor,
            fontFamily: 'Montserrat',
            fontSize: 14,
          ),
        ),
      ),
      onPressed: onPressed,
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          side: MaterialStateProperty.all(
              const BorderSide(color: ThemeColours.secondaryColor))),
    );
  }
}
