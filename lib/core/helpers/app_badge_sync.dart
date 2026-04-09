import 'package:app_badge_plus/app_badge_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/domain/model/notifications/notifications_model.dart';
import 'package:icoc/presentation/bloc/bible_study_bloc/bible_study_bloc.dart';
import 'package:icoc/presentation/bloc/insights/insights_bloc.dart';
import 'package:icoc/presentation/bloc/insights/insights_state.dart';
import 'package:icoc/presentation/bloc/notifications_bloc/notifications_bloc.dart';
import 'package:icoc/presentation/bloc/songs_bloc/songs_bloc.dart';

class AppBadgeUnreadCounter {
  const AppBadgeUnreadCounter._();

  static int notifications(
    NotificationsState state, {
    required int fallback,
  }) {
    return state.maybeWhen(
      success: (List<NotificationsModel> notifications) => notifications
          .where((NotificationsModel notification) => !notification.isRead)
          .length,
      orElse: () => fallback,
    );
  }

  static int songs(
    SongsState state, {
    required int fallback,
  }) {
    return state.maybeWhen(
      success: (_, int unreadCount, __) => unreadCount,
      empty: () => 0,
      orElse: () => fallback,
    );
  }

  static int bibleStudy(
    BibleStudyState state, {
    required int fallback,
  }) {
    return state.maybeWhen(
      success: (_, int unreadCount, __, ___) => unreadCount,
      empty: () => 0,
      orElse: () => fallback,
    );
  }

  static int insights(
    InsightsState state, {
    required int fallback,
  }) {
    return state.maybeWhen(
      loaded: (
        _,
        __,
        ___,
        ____,
        _____,
        int unreadCount,
        ______,
      ) =>
          unreadCount,
      orElse: () => fallback,
    );
  }

  static int total({
    required int notifications,
    required int songs,
    required int bibleStudy,
    required int insights,
  }) {
    return notifications + songs + bibleStudy + insights;
  }
}

class AppBadgeSync extends StatefulWidget {
  const AppBadgeSync({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AppBadgeSync> createState() => _AppBadgeSyncState();
}

class _AppBadgeSyncState extends State<AppBadgeSync> {
  int _notificationsUnread = 0;
  int _songsUnread = 0;
  int _bibleStudyUnread = 0;
  int _insightsUnread = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _hydrateCountsFromCurrentState();
      _syncBadge();
    });
  }

  void _hydrateCountsFromCurrentState() {
    _notificationsUnread = AppBadgeUnreadCounter.notifications(
      context.read<NotificationsBloc>().state,
      fallback: _notificationsUnread,
    );
    _songsUnread = AppBadgeUnreadCounter.songs(
      context.read<SongsBloc>().state,
      fallback: _songsUnread,
    );
    _bibleStudyUnread = AppBadgeUnreadCounter.bibleStudy(
      context.read<BibleStudyBloc>().state,
      fallback: _bibleStudyUnread,
    );
    _insightsUnread = AppBadgeUnreadCounter.insights(
      context.read<InsightsBloc>().state,
      fallback: _insightsUnread,
    );
  }

  void _syncBadge() {
    final int totalUnread = AppBadgeUnreadCounter.total(
      notifications: _notificationsUnread,
      songs: _songsUnread,
      bibleStudy: _bibleStudyUnread,
      insights: _insightsUnread,
    );
    AppBadgePlus.updateBadge(totalUnread);
  }

  void _onNotificationsChanged(NotificationsState state) {
    final int nextUnread = AppBadgeUnreadCounter.notifications(
      state,
      fallback: _notificationsUnread,
    );
    if (nextUnread == _notificationsUnread) {
      return;
    }
    _notificationsUnread = nextUnread;
    _syncBadge();
  }

  void _onSongsChanged(SongsState state) {
    final int nextUnread = AppBadgeUnreadCounter.songs(
      state,
      fallback: _songsUnread,
    );
    if (nextUnread == _songsUnread) {
      return;
    }
    _songsUnread = nextUnread;
    _syncBadge();
  }

  void _onBibleStudyChanged(BibleStudyState state) {
    final int nextUnread = AppBadgeUnreadCounter.bibleStudy(
      state,
      fallback: _bibleStudyUnread,
    );
    if (nextUnread == _bibleStudyUnread) {
      return;
    }
    _bibleStudyUnread = nextUnread;
    _syncBadge();
  }

  void _onInsightsChanged(InsightsState state) {
    final int nextUnread = AppBadgeUnreadCounter.insights(
      state,
      fallback: _insightsUnread,
    );
    if (nextUnread == _insightsUnread) {
      return;
    }
    _insightsUnread = nextUnread;
    _syncBadge();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NotificationsBloc, NotificationsState>(
          listener: (_, NotificationsState state) => _onNotificationsChanged(
            state,
          ),
        ),
        BlocListener<SongsBloc, SongsState>(
          listener: (_, SongsState state) => _onSongsChanged(state),
        ),
        BlocListener<BibleStudyBloc, BibleStudyState>(
          listener: (_, BibleStudyState state) => _onBibleStudyChanged(state),
        ),
        BlocListener<InsightsBloc, InsightsState>(
          listener: (_, InsightsState state) => _onInsightsChanged(state),
        ),
      ],
      child: widget.child,
    );
  }
}
