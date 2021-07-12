import 'package:Projects/app/screens/main_screen.dart';
import 'package:Projects/first_principles/presentation/screens/first_principles.dart';
import 'package:Projects/news/presentation/screens/news.dart';
import 'package:Projects/q_and_a/presentation/screens/q_and_a.dart';
import 'package:Projects/settings/presentation/general_settings.dart';
import 'package:Projects/song_book/models/song.dart';
import 'package:Projects/song_book/presentation/screens/song_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
Route onGenerateRoute(RouteSettings settings) {

  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (_) => MainScreen(),
      );
    case '/songBook':
      return MaterialPageRoute(
        builder: (_) => SongBook(),);
    case '/Q&A':
      return MaterialPageRoute(
          builder: (_) => QuestionsAndAnwers(),);
    case '/news':
      return MaterialPageRoute(
        builder: (_) => News(),);
    case '/firstPrinciples':
      return MaterialPageRoute(
        builder: (_) => FirstPrinciples(),);
          case '/settings':
      return MaterialPageRoute(builder: (_) => GeneralSettings());
    default:
      return MaterialPageRoute(
  builder: (_) => MainScreen(),
  );
  }
}
}