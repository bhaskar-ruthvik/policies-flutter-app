import 'dart:ui';

import 'package:flutter/material.dart';

abstract class ThemeColours {
  static const Color primaryColor = Color(0xFF424A5F);
  static const Color secondaryColor = Color(0xFF7A87AB);
  static const Color accentColor = Color(0xFF11A68C);
}

abstract class ThemeText {
  static const TextStyle titleText2 = TextStyle(
      fontFamily: 'Montserrat',
      color: ThemeColours.secondaryColor,
      fontSize: 15,
      letterSpacing: 3,
      fontWeight: FontWeight.w700);

  static const TextStyle bodyText = TextStyle(
      fontFamily: 'Montserrat',
      color: ThemeColours.primaryColor,
      fontSize: 15,
      fontWeight: FontWeight.w400);

  static const TextStyle titleText = TextStyle(
      fontFamily: 'Montserrat',
      color: ThemeColours.primaryColor,
      fontSize: 30,
      fontWeight: FontWeight.w600);
}
