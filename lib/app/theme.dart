import 'package:flutter/material.dart';

class CustomTheme {
  static const Color primaryColor = Color(0xFFf88f00);
  static const double symmetricHozPadding = 13.0;
  static const Color lightGray = Color(0xFF707070);
  static const Color gray = Color(0xFFDEDEDE);
  static const Color darkGray = Color(0xFF3E3E3E);
  static const Color lightTextColor = Color(0xff131313);
  static const Color yellow = Color(0xFFFFC107);
  static const Color backgroundColor = Color(0xFFF8F6F8);
  static const Color googleColor = Color(0xFFDB4437);
  static const Color facebookColor = Color(0xFF4267B2);
  static const Color twitter = Color(0xFF1DA1F2);
  static const Color instagram = Color(0xFFFD1D1D);
  static const Color linkedIn = Color(0xFF2867B2);
  static const Color orangeColor = Color(0xFFEF8767);
  static const Color shadowColor = Color(0x1A000000);

  static const Color alternativeWhite = Color(0xffF8F6F8);
  static const Color anotherBlack = Color(0xff060606);
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: primaryColor,
    primaryColorDark: primaryColor,
    shadowColor: Colors.black,
    appBarTheme:
        const AppBarTheme(iconTheme: IconThemeData(color: primaryColor)),
    scaffoldBackgroundColor: backgroundColor,
    iconTheme: const IconThemeData(color: anotherBlack),
    bottomAppBarColor: Colors.white,
    fontFamily: "Montserrat",
    textTheme: const TextTheme(
      headline1: TextStyle(
          color: lightTextColor, fontWeight: FontWeight.bold, fontSize: 24),
      headline2: TextStyle(
          color: lightTextColor, fontWeight: FontWeight.bold, fontSize: 22),
      headline3: TextStyle(
          color: lightTextColor, fontWeight: FontWeight.bold, fontSize: 20),
      headline4: TextStyle(fontSize: 18, color: lightTextColor),
      headline5: TextStyle(color: lightTextColor, fontSize: 16),
      headline6: TextStyle(
          color: lightTextColor, fontSize: 14, fontWeight: FontWeight.w300),
      caption: TextStyle(color: lightTextColor, fontSize: 8),
      subtitle2: TextStyle(color: lightTextColor, fontSize: 12),
      subtitle1: TextStyle(color: lightTextColor, fontSize: 10),
      button: TextStyle(color: lightTextColor, fontSize: 12),
      bodyText1: TextStyle(fontSize: 12, color: lightTextColor),
      bodyText2: TextStyle(fontSize: 10, color: lightTextColor),
    ),
  );
}
