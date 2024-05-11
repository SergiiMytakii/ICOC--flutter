import 'package:icoc/core/repository/bible_study_repository.dart';
import 'package:icoc/core/repository/feedback_repository.dart';
import 'package:icoc/core/repository/notifications_repository.dart';
import 'package:icoc/core/repository/q&a_repository.dart';
import 'package:icoc/core/repository/songs_repository.dart';
import 'package:icoc/core/repository/video_repository.dart';
import 'package:icoc/data/repository_impl/bible_study_repository_impl.dart';
import 'package:icoc/data/repository_impl/feedback_repository_impl.dart';
import 'package:icoc/data/repository_impl/notifications_repository_impl.dart';
import 'package:icoc/data/repository_impl/q&a_repository_impl.dart';
import 'package:icoc/data/repository_impl/songs_repository_impl.dart';
import 'package:icoc/data/repository_impl/video_repository_impl.dart';

class RepositoryModule {
  static BibleStudyRepository? _bibleStudyRepository;
  static BibleStudyRepository bibleStudyRepository() {
    _bibleStudyRepository ??= BibleStudyRepositoryImpl();
    return _bibleStudyRepository!;
  }

  static FeedbackRepository? _feedbackRepository;
  static FeedbackRepository feedbackRepository() {
    _feedbackRepository ??= FeedbackRepositoryImpl();
    return _feedbackRepository!;
  }

  static NotificationsRepository? _notificationsRepository;
  static NotificationsRepository notificationsRepository() {
    _notificationsRepository ??= NotificationsRepositoryImpl();
    return _notificationsRepository!;
  }

  static QandARepository? _qandARepository;
  static QandARepository qandARepository() {
    _qandARepository ??= QandARepositoryImpl();
    return _qandARepository!;
  }

  static SongsRepository? _songsRepository;
  static SongsRepository songsRepository() {
    _songsRepository ??= SongsRepositoryImpl();
    return _songsRepository!;
  }

  static VideoRepository? _videoRepository;
  static VideoRepository videoRepository() {
    _videoRepository ??= VideoRepositoryImpl();
    return _videoRepository!;
  }
}
