import 'package:flutter/material.dart';

const appBlue = Color(0xFF162ECD);
const appDarkBlue = Color(0xFF071571);
const appLightBlue =   Color(0xFF5E73FD);
const appBlue1 = Color(0xFF4B45F2);
const appBlue2 = Color(0xFFA2A5D8);
const appWhite = Color(0xFFFAF8FC);
const appOrange = Color(0xFFE6704A);
const appBatas = Color(0xFF61BBF3);

ThemeData appLight = ThemeData(
  primaryColor: appBlue,
  appBarTheme: const AppBarTheme(
    backgroundColor: appBlue,
  ), 
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: appDarkBlue),
    bodyText2: TextStyle(color: appBlue),
  )
);


ThemeData appDark = ThemeData(
  primaryColor: appDarkBlue,
  scaffoldBackgroundColor: appDarkBlue,
  appBarTheme: const AppBarTheme(
    backgroundColor: appBlue,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: appWhite),
    bodyText2: TextStyle(color: appWhite),

  ),
  buttonTheme: const ButtonThemeData(buttonColor: appWhite),
);

