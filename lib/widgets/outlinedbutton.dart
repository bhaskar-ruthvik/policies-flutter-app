import 'package:flutter/material.dart';
import 'package:policies_app/utils.dart';

class Outlinedbutton extends StatelessWidget {
  const Outlinedbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        'Next Question',
        style: TextStyle(
          color: ThemeColours.secondaryColor,
          fontFamily: 'Montserrat',
          fontSize: 14,
        ),
      ),
      onPressed: () {},
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          side: MaterialStateProperty.all(
              const BorderSide(color: ThemeColours.secondaryColor))),
    );
  }
}
