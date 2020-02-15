import 'package:flutter/material.dart';

abstract class Styles {
//  COLORS
  static const Color primaryColor = Color.fromRGBO(81, 193, 228, 1);
  static const Color secondaryColor = Color.fromRGBO(81, 193, 228, 1);
  static const Color tertiaryColor = Color.fromRGBO(0, 0, 0, 0.1);
  static const Color greyColor = Color.fromRGBO(0, 0, 0, 0.1);
  static const Color blackColorOpacity = Color.fromRGBO(29, 29, 29, 1);
  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color blueColor = Color.fromRGBO(81, 193, 228, 1);
  static const Color darkBlue = Color.fromRGBO(10, 124, 159, 1);
  static const Color redColor = Color.fromRGBO(240, 93, 92, 1);
  static const Color transparent = Colors.transparent;
  static const Color logoColor = Color.fromRGBO(112, 112, 112, 1);
  static const Color amber = Colors.amber;

  static const TextStyle snackTextStyle = TextStyle(color: Styles.whiteColor);

//  Default Font
  static const String defaultFontFamily = 'Brandon';
  static const String ralewayRegularFontFamily = 'Raleway';

//  FONT SIZES
  static double largeFont = 40;
  static double mediumFont = 30;
  static double semiMediumFont = 25;
  static double smallFont = 19;
  static double textTagFont = 16;
  static double extremeSmall = 13;

//  ASSETS
  static const String science = 'assets/science.jpeg';
  static const String sports = 'assets/sports.jpeg';
  static const String health = 'assets/health.jpeg';
  static const String business = 'assets/business.jpeg';
  static const String technology = 'assets/technology.jpeg';
  static const String entertainment = 'assets/entertainment.jpeg';
}
