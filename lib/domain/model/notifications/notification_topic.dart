enum NotificationTopic {
  songbook,
  insights,
  biblestudy,
  video,
}

extension NotificationTopicX on NotificationTopic {
  String get topic {
    switch (this) {
      case NotificationTopic.songbook:
        return 'songbook';
      case NotificationTopic.insights:
        return 'insights';
      case NotificationTopic.biblestudy:
        return 'biblestudy';
      case NotificationTopic.video:
        return 'video';
    }
  }

  /// Localization key to display in UI
  String get labelKey {
    switch (this) {
      case NotificationTopic.songbook:
        return 'drawer_song_book';
      case NotificationTopic.insights:
        return 'Insights';
      case NotificationTopic.biblestudy:
        return 'drawer_first_principles';
      case NotificationTopic.video:
        return 'Video';
    }
  }
}
