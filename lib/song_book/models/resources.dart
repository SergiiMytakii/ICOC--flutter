class Resources {
  final String lang;
  final String title;
  final String link;
  final String? thumbnail;
  final String? artist;
  Resources(
      {required this.lang,
      required this.title,
      required this.link,
      this.thumbnail,
      this.artist});

  factory Resources.fromJson(Map json) {
    return Resources(
        lang: json['lang'],
        title: json['title'],
        link: json['link'],
        thumbnail: json['thumbnail'],
        artist: json['artist']);
  }
}
