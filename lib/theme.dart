import 'package:flutter/material.dart';

final myDarkTheme = ThemeData.dark().copyWith(
  accentColor: Colors.amber,
);
final myLightTheme = ThemeData.light().copyWith(
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(fontSize: 20),
      unselectedLabelStyle: TextStyle(fontSize: 20),
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
      headline5: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      headline4: TextStyle(
          fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
      headline3: TextStyle(
          fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(fontSize: 16, color: Colors.black),
    ),
    iconTheme: IconThemeData(color: Colors.white10));
