class Resources {
  final String lang;
  final String title;
  final String link;
  Resources({
    required this.lang,
    required this.title,
    required this.link,
  });

  factory Resources.fromJson(Map json) {
    return Resources(
        lang: json['lang'], title: json['title'], link: json['link']);
  }
}
