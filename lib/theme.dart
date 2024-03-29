import 'package:flutter/material.dart';

final myDarkTheme = ThemeData.dark().copyWith(
  appBarTheme: AppBarTheme(backgroundColor: Colors.black),
  tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(fontSize: 16),
      unselectedLabelStyle: TextStyle(fontSize: 16),
      labelColor: Color(0xffff595e),
      indicatorColor: Color(0xffff595e)),
  primaryColor: Color(0xff6a4c93),
  primaryColorLight: Color(0xffbeaed5),
  primaryColorDark: Color(0xff614587),
  //bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.grey),
  iconTheme: IconThemeData(
    color: Color(0xffbeaed5),
  ),
  primaryIconTheme: IconThemeData(color: Color(0xffbeaed5)),
  scaffoldBackgroundColor: Colors.black54,
  brightness: Brightness.dark,
  colorScheme: ColorScheme(
    background: Colors.black,
    onBackground: Colors.white,
    brightness: Brightness.dark,
    primary: Color(0xff6a4c93),
    onPrimary: Colors.white,
    secondary: Colors.black54,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.black,
    surface: Color.fromARGB(255, 70, 70, 70),
    onSurface: Colors.white,
  ),
);

final myLightTheme = ThemeData.light().copyWith(
  appBarTheme: AppBarTheme(backgroundColor: Colors.white),
  brightness: Brightness.light,
  tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(fontSize: 16),
      unselectedLabelStyle: TextStyle(fontSize: 16),
      labelColor: Color(0xffff595e),
      indicatorColor: Color(0xffff595e)),
  primaryColor: Color(0xff6a4c93),
  primaryColorLight: Color(0xffbeaed5),
  primaryColorDark: Color(0xff614587),
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
  iconTheme: IconThemeData(color: Color(0xff6a4c93)),
  primaryIconTheme: IconThemeData(color: Color(0xff6a4c93)),
  colorScheme: ColorScheme(
    background: Colors.white,
    onBackground: Colors.black,
    brightness: Brightness.light,
    primary: Color(0xff6a4c93),
    onPrimary: Colors.white,
    secondary: Colors.grey.withOpacity(0.9),
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    surface: Color.fromARGB(255, 226, 226, 226),
    onSurface: Colors.black,
  ),
);
