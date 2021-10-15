import 'package:icoc/index.dart';
import 'package:icoc/news/logic/services/network_service.dart';
import 'package:icoc/news/logic/services/news_service.dart';
import 'package:icoc/news/models/news_model.dart';

class NewsController extends GetxController {
  final NewsService newsService = NewsService();
  RxList<News> allNews = <News>[].obs;
  RxList<News> news = <News>[].obs;
  List<int> categoriesInt = [];
  RxList<String> allCategories = <String>[].obs;
  RxBool fullText = false.obs;
  GetStorage box = GetStorage();
  RxDouble fontSize = 14.0.obs;

  @override
  void onInit() async {
    allNews.value = await newsService.getNews();
    loadFontSize();
    allCategories.value = getCategories();
    news.value = List.from(allNews);
    print(news.length);
    super.onInit();
  }

  List<String> getCategories() {
    List<int> x = [];
    allNews.forEach((element) {
      x.addAll(element.categories as Iterable<int>);
      for (int item in x) {
        if (!categoriesInt.contains(item)) {
          categoriesInt.add(item);
        }
      }
    });
    return List.from(categoriesInt.map((element) => categories[element]));
  }

  void filterNews(String category) {
    if (category.isNotEmpty) {
      var key = categories.keys.firstWhere((k) => categories[k] == category);
      print(key);
      news.clear();
      print('allNews ${allNews.length}');

      for (News item in allNews) {
        if (item.categories!.contains(key)) {
          print(item.title);
          news.add(item);
        }
      }
    } else
      news = allNews;
  }

  void clearFilter() {
    news.value = List.from(allNews);
    notifyChildrens();
  }

  void loadFontSize() {
    if (box.read('news_fontSize') != null)
      fontSize.value = box.read('news_fontSize');
  }

  altFontSizeForce(double val) {
    fontSize.value = val;
    box.write('news_fontSize', val);
    Get.forceAppUpdate();
  }

  altFontSize(double val) {
    fontSize.value = val;
    box.write('news_fontSize', val);
  }
}

Map<int, String> categories = {
  1: 'Без категории',
  108: 'Изучение Библии: вопросы, статьи, уроки',
  109: 'Духовная жизнь человека и общества',
  113: 'Церкви в Европе',
  117: 'Новости Церквей Азии',
  118: 'Ближнее зарубежье',
  119: 'Новости Церквей Америки',
  120: 'Христианские церкви Африки',
  121: 'Христианские церкви Украины ',
  122: 'Библейская археология - раскопки и древние города',
  124: 'Библейские семинары',
  126: 'Христианская апологетика',
  127: 'Библейские уроки',
  132: 'Христианское прославление ',
  133: 'Духовная помощь людям',
  136: 'Духовная жизнь семьи',
  137: 'Духовные отношения',
  141: 'Служителям церкви',
  145: 'Новости сайта',
  146: 'Церкви в Беларуси',
  150: 'Библейские вопросы и ответы ',
  151: 'Новости всех Церквей',
  154: 'Духовное воспитание детей',
  213: 'Опыт духовной жизни',
  214: 'Начинающему христианину',
  216: 'Христианские программы и приложения',
  219: 'Христианские программы ',
  258: 'Христианские ролики и видео ',
  264: 'Адреса церквей',
  339: 'Христианские тесты по Библии',
  376: 'Духовные статьи для женщин',
  379: 'Церкви Ближнего Востока ',
  460: 'Христианские церкви России ',
};
