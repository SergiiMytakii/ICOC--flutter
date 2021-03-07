import 'package:flutter/material.dart';

final myDarkTheme = ThemeData.dark().copyWith(
  accentColor: Colors.amber,
);
final myLightTheme = ThemeData.light().copyWith(
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(fontSize: 20),
      unselectedLabelStyle: TextStyle(fontSize: 20),
    ),
    iconTheme: IconThemeData(color: Colors.white10));
