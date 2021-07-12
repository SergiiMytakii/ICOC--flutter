import 'package:flutter/material.dart';

final myDarkTheme = ThemeData.dark().copyWith(
  accentColor: Colors.amber,
);
final myLightTheme = ThemeData.light().copyWith(
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(fontSize: 20),
      unselectedLabelStyle: TextStyle(fontSize: 20),
    ),
    primaryColor: Color(0xff6a4c93),
    primaryColorLight: Color(0xffbeaed5),
    primaryColorDark: Color(0xff614587),
    accentColor: Color(0xff7E5DAC),
    iconTheme: IconThemeData(color: Colors.white10));
