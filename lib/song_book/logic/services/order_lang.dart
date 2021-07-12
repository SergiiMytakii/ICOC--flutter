import 'package:shared_preferences/shared_preferences.dart';

class OrderLang {
  Stream<List<String>> orderLang() async* {
    SharedPreferences prefLanguages = await SharedPreferences.getInstance();

    List<String> orderLang =
        (prefLanguages.getStringList('orderLang') ?? ['ru', 'uk', 'en']);

    yield orderLang;
  }
}
