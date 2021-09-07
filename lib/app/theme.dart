import 'package:flutter/cupertino.dart';
import '../index.dart';

final myDarkTheme = ThemeData.dark().copyWith(
    accentColor: Colors.amber,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.grey),
    brightness: Brightness.dark);
final myLightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(fontSize: 20),
      unselectedLabelStyle: TextStyle(fontSize: 20),
    ),
    appBarTheme: AppBarTheme(elevation: 0),
    backgroundColor: Colors.white,
    primaryColor: Color(0xff6a4c93),
    primaryColorLight: Color(0xffbeaed5),
    primaryColorDark: Color(0xff614587),
    accentColor: Color(0xff7E5DAC),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
    iconTheme: IconThemeData(color: Colors.white10));
