import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  const Card({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(0.5, 2.0),
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
