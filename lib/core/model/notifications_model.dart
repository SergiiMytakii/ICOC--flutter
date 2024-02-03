class NotificationsModel {
  final String title;
  final String text;
  final String? topic;
  final String? link;
  bool isRead;
  NotificationsModel(
      {required this.title,
      required this.text,
      this.topic,
      this.link,
      this.isRead = false});
}
