import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

abstract class ThemeColours {
  static const Color primaryColor = Color(0xFF424A5F);
  static const Color secondaryColor = Color(0xFF7A87AB);
  static const Color accentColor = Color(0xFF11A68C);
}

abstract class ThemeText {
  static TextStyle titleText2 = GoogleFonts.montserrat(
      textStyle: const TextStyle(
          color: ThemeColours.secondaryColor,
          fontSize: 15,
          letterSpacing: 3,
          fontWeight: FontWeight.bold));

  static TextStyle yesNoText = GoogleFonts.montserrat(
      textStyle: const TextStyle(
          color: ThemeColours.accentColor,
          fontSize: 30,
          fontWeight: FontWeight.bold));

  static TextStyle bodyText = GoogleFonts.montserrat(
      textStyle: const TextStyle(
          color: ThemeColours.primaryColor,
          fontSize: 15,
          fontWeight: FontWeight.w500));

  static TextStyle flowchartText = GoogleFonts.montserrat(
      textStyle: const TextStyle(
          color: ThemeColours.primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.w500));

  static TextStyle titleText = GoogleFonts.montserrat(
      textStyle: const TextStyle(
          color: ThemeColours.primaryColor,
          fontSize: 30,
          fontWeight: FontWeight.bold));
}
