import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/core/helpers/app_badge_sync.dart';
import 'package:icoc/domain/model/notifications/notifications_model.dart';
import 'package:icoc/presentation/bloc/bible_study_bloc/bible_study_bloc.dart';
import 'package:icoc/presentation/bloc/insights/insights_state.dart';
import 'package:icoc/presentation/bloc/notifications_bloc/notifications_bloc.dart';
import 'package:icoc/presentation/bloc/songs_bloc/songs_bloc.dart';

void main() {
  group('AppBadgeUnreadCounter', () {
    test('sums unread counts from notifications and home menu sections', () {
      final notificationsState = NotificationsState.success(
        <NotificationsModel>[
          NotificationsModel(
            id: '1',
            notifications: const <NotificationVersion>[
              NotificationVersion(
                id: '1-en',
                title: 'One',
                text: 'Text',
                lang: 'en',
              ),
            ],
          ),
          NotificationsModel(
            id: '2',
            notifications: const <NotificationVersion>[
              NotificationVersion(
                id: '2-en',
                title: 'Two',
                text: 'Text',
                lang: 'en',
              ),
            ],
            isRead: true,
          ),
        ],
      );
      const songsState = SongsState.success(
        songs: [],
        unreadCount: 3,
        newSongIds: <int>{1, 2, 3},
      );
      const bibleStudyState = BibleStudyState.success(
        topics: [],
        unreadCount: 2,
        newTopicIds: <int>{10},
        newLessonIds: <int>{20},
      );
      const insightsState = InsightsState.loaded(
        posts: [],
        unreadCount: 4,
      );

      final total = AppBadgeUnreadCounter.total(
        notifications: AppBadgeUnreadCounter.notifications(
          notificationsState,
          fallback: 0,
        ),
        songs: AppBadgeUnreadCounter.songs(songsState, fallback: 0),
        bibleStudy: AppBadgeUnreadCounter.bibleStudy(
          bibleStudyState,
          fallback: 0,
        ),
        insights: AppBadgeUnreadCounter.insights(insightsState, fallback: 0),
      );

      expect(total, 10);
    });

    test('keeps previous count during transient loading states', () {
      expect(
        AppBadgeUnreadCounter.notifications(
          const NotificationsState.loading(),
          fallback: 5,
        ),
        5,
      );
      expect(
        AppBadgeUnreadCounter.songs(
          const SongsState.loading(),
          fallback: 4,
        ),
        4,
      );
      expect(
        AppBadgeUnreadCounter.bibleStudy(
          const BibleStudyState.loading(),
          fallback: 3,
        ),
        3,
      );
      expect(
        AppBadgeUnreadCounter.insights(
          const InsightsState.loading(),
          fallback: 2,
        ),
        2,
      );
    });
  });
}
