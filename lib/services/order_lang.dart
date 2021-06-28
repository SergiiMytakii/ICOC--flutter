import 'package:shared_preferences/shared_preferences.dart';

class OrderLang {
  Stream orderLang() async* {
    SharedPreferences prefLanguages = await SharedPreferences.getInstance();

    List<String> _orderLang =
        (prefLanguages.getStringList('orderLang') ?? ['ru', 'uk', 'en']);
    yield _orderLang;
  }
}
