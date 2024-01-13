import 'package:flutter/material.dart';

final myDarkTheme = ThemeData.dark().copyWith(
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(fontSize: 20),
      unselectedLabelStyle: TextStyle(fontSize: 20),
    ),
    //bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.grey),
    iconTheme: IconThemeData(color: Colors.white10),
    primaryIconTheme: IconThemeData(color: Colors.white70),
    brightness: Brightness.dark);
final myLightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(fontSize: 20),
      unselectedLabelStyle: TextStyle(fontSize: 20),
    ),
    appBarTheme: AppBarTheme(elevation: 0, color: Color(0xff6a4c93)),
    backgroundColor: Colors.white,
    primaryColor: Color(0xff6a4c93),
    primaryColorLight: Color(0xffbeaed5),
    primaryColorDark: Color(0xff614587),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
    iconTheme: IconThemeData(color: Colors.white10),
    primaryIconTheme: IconThemeData(color: Colors.black54));
