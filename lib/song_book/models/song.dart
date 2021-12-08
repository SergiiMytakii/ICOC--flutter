class Song {
  final int id;
  final Map title;
  final Map text;
  // final String?
  // searchLang; // нужен для идентификации языка песни, когда мы нашли ее через поиск
  Song({
    required this.id,
    required this.text,
    required this.title,
    //this.searchLang
  });
}
