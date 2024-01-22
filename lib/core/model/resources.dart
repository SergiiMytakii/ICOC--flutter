class Resources {
  final String lang;
  final String title;
  final String link;
  final String? thumbnail;
  final String? artist;
  final String? publishedAt;
  final String? description;

  Resources(
      {required this.lang,
      required this.title,
      required this.link,
      this.thumbnail,
      this.publishedAt,
      this.description,
      this.artist});

  factory Resources.fromJson(Map json) {
    return Resources(
        lang: json['lang'],
        title: json['title'],
        link: json['link'],
        thumbnail: json['thumbnail'],
        artist: json['artist']);
  }
  static defaultResource() {
    return Resources(lang: '', title: '', link: '', thumbnail: '', artist: '');
  }

  factory Resources.fromJsonYoutobePlaylists(Map json) {
    //log.w(json);
    return Resources(
        lang: '',
        title: json['title'],
        link: json["resourceId"]["videoId"],
        thumbnail: json["thumbnails"] != null
            ? json["thumbnails"]["high"] != null
                ? json["thumbnails"]["high"]["url"]
                : null
            : null,
        publishedAt: json["publishedAt"],
        description: json["description"],
        artist: json['artist']);
  }
}
