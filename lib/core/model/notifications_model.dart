class NotificationsModel {
  final String id;
  final String title;
  final String text;
  final String? link;
  final String lang;
  bool isRead;

  NotificationsModel({
    required this.title,
    required this.text,
    required this.id,
    required this.lang,
    this.link,
    this.isRead = false,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json, String id) {
    return NotificationsModel(
      id: id,
      title: json['title'],
      text: json['text'],
      lang: json['lang'],
      link: json['link'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'text': text,
      'lang': lang,
      'link': link,
    };
  }
}
