import 'package:flutter/material.dart';
import 'package:policies_app/screens/home_screen.dart';
import 'package:policies_app/utils.dart';

class NextQuestionButton extends StatelessWidget {
  const NextQuestionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Homescreen();
        }));
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          side: MaterialStateProperty.all(
              const BorderSide(color: ThemeColours.secondaryColor))),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
        child: Text(
          'Ask Another Question',
          style: TextStyle(
            color: ThemeColours.secondaryColor,
            fontFamily: 'Montserrat',
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
