import 'package:flutter/material.dart';

final myDarkTheme = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
  tabBarTheme: const TabBarTheme(
      labelStyle: TextStyle(fontSize: 16),
      unselectedLabelStyle: TextStyle(fontSize: 16),
      labelColor: Color(0xffff595e),
      indicatorColor: Color(0xffff595e)),
  primaryColor: const Color(0xff6a4c93),
  primaryColorLight: const Color(0xffbeaed5),
  primaryColorDark: const Color(0xff614587),
  //bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.grey),
  iconTheme: const IconThemeData(
    color: Color(0xffbeaed5),
  ),
  primaryIconTheme: const IconThemeData(color: Color(0xffbeaed5)),
  scaffoldBackgroundColor: Colors.black54,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff6a4c93),
    onPrimary: Colors.white,
    secondary: Colors.black54,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.black,
    surface: Colors.black,
    onSurface: Colors.white,
  ),
);

final myLightTheme = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
  brightness: Brightness.light,
  tabBarTheme: const TabBarTheme(
      labelStyle: TextStyle(fontSize: 16),
      unselectedLabelStyle: TextStyle(fontSize: 16),
      labelColor: Color(0xffff595e),
      indicatorColor: Color(0xffff595e)),
  primaryColor: const Color(0xff6a4c93),
  primaryColorLight: const Color(0xffbeaed5),
  primaryColorDark: const Color(0xff614587),
  scaffoldBackgroundColor: Colors.white,
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
  iconTheme: const IconThemeData(color: Color(0xff6a4c93)),
  primaryIconTheme: const IconThemeData(color: Color(0xff6a4c93)),
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: const Color(0xff6a4c93),
    onPrimary: Colors.white,
    secondary: Colors.grey.withOpacity(0.9),
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
  ),
);
