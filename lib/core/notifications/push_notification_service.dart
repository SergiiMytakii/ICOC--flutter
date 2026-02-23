import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:icoc/presentation/bloc/insights/insights_event.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/routes/app_routes.dart';
import 'package:icoc/core/routes/app_router.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/notifications_bloc/notifications_bloc.dart';
import 'package:icoc/presentation/bloc/songs_bloc/songs_bloc.dart';
import 'package:icoc/presentation/bloc/q&a_bloc/list_q&a/q&a_bloc.dart';
import 'package:icoc/presentation/bloc/video_bloc/video_bloc.dart';
import 'package:icoc/presentation/bloc/bible_study_bloc/bible_study_bloc.dart';
import 'package:icoc/presentation/bloc/insights/insights_bloc.dart';

import 'package:icoc/core/user_languages.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

@Singleton()
class PushNotificationService {
  PushNotificationService(this._localCache);
  final log = Logger();
  final LocalCache _localCache;
  final FlutterLocalNotificationsPlugin _local =
      FlutterLocalNotificationsPlugin();
  static const String _channelId = 'icoc_default_channel';
  static const String _silentChannelId = 'icoc_silent_channel';
  int _notificationIdCounter = 0;

  // Notification details constants
  static const NotificationDetails _silentNotificationDetails =
      NotificationDetails(
    android: AndroidNotificationDetails(
      _silentChannelId,
      'Silent Notifications',
      channelDescription: 'ICOC Silent Notifications',
      importance: Importance.low,
      priority: Priority.low,
      playSound: false,
      enableVibration: false,
      icon: '@mipmap/launcher_icon',
      showProgress: false,
      ongoing: false,
      autoCancel: true,
    ),
    iOS: DarwinNotificationDetails(
      presentSound: false,
      presentAlert: true,
      presentBadge: false,
    ),
  );

  static const NotificationDetails _soundNotificationDetails =
      NotificationDetails(
    android: AndroidNotificationDetails(
      _channelId,
      'Notifications',
      channelDescription: 'ICOC',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/launcher_icon',
    ),
    iOS: DarwinNotificationDetails(),
  );

  int _generateNotificationId() {
    return ++_notificationIdCounter;
  }

  static int _deterministicHash(String input) {
    int hash = 0;
    for (int i = 0; i < input.length; i++) {
      hash = 31 * hash + input.codeUnitAt(i);
    }
    return hash & 0x7FFFFFFF;
  }

  Future<void> initialize() async {
    tz.initializeTimeZones();
    await _initLocalNotifications();
    await _initFCM();
    // Topic subscriptions are handled after permission is granted in requestNotificationPermissionIfNeeded
  }

  Future<void> _subscribeTopicSafe(String topic) async {
    try {
      await FirebaseMessaging.instance.subscribeToTopic(topic);
    } catch (e, st) {
      log.w('FCM subscribe failed for $topic', error: e, stackTrace: st);
    }
  }

  Future<void> _unsubscribeTopicSafe(String topic) async {
    try {
      await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
    } catch (e, st) {
      log.w('FCM unsubscribe failed for $topic', error: e, stackTrace: st);
    }
  }

  Future<void> _initLocalNotifications() async {
    const AndroidInitializationSettings androidInit =
        AndroidInitializationSettings('@mipmap/launcher_icon');
    const DarwinInitializationSettings iosInit = DarwinInitializationSettings();
    const InitializationSettings initSettings =
        InitializationSettings(android: androidInit, iOS: iosInit);
    await _local.initialize(initSettings,
        onDidReceiveNotificationResponse: (details) async {
      final payload = details.payload;
      if (payload != null && payload.isNotEmpty) {
        try {
          final data = json.decode(payload) as Map<String, dynamic>;
          await _refreshByData(data);
          await _navigateByData(data);
          return;
        } catch (_) {}
      }
      getIt<NotificationsBloc>().add(const NotificationsListRequested());
      router.go(NOTIFICATIONS_SCREEN);
    });
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      _channelId,
      'Notifications',
      description: 'ICOC',
      importance: Importance.high,
    );
    await _local
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // Create silent notification channel for local notifications
    const AndroidNotificationChannel silentChannel = AndroidNotificationChannel(
      _silentChannelId,
      'Silent Notifications',
      description: 'ICOC Silent Notifications',
      importance:
          Importance.low, // Low importance - won't show in notification bar
    );
    await _local
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(silentChannel);
  }

  Future<void> _initFCM() async {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    final messaging = FirebaseMessaging.instance;
    final settings = await messaging.getNotificationSettings();
    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      FirebaseMessaging.instance.onTokenRefresh.listen((t) async {
        try {
          await _localCache.saveString(StorageKeys.fcmToken, t);
          await _syncToken(t);
          final String? locale = _localCache.getString(StorageKeys.locale);
          if (locale != null && locale.isNotEmpty) {
            await _subscribeTopicSafe('general-lang-$locale');
          }
          final Map<String, dynamic> songsMap =
              getIt<SongsUserLanguagesHandler>().languages;
          final Map<String, dynamic> bibleMap =
              getIt<BibleStudyUserLanguagesHandler>().languages;
          final Map<String, dynamic> insightsMap =
              getIt<InsightsUserLanguagesHandler>().languages;
          unawaited(syncTopicLangSubscriptionsFor('songbook', songsMap));
          unawaited(syncTopicLangSubscriptionsFor('biblestudy', bibleMap));
          unawaited(syncTopicLangSubscriptionsFor('insights', insightsMap));
          unawaited(_ensureTopicSubscriptionsInitialized());
        } catch (e, st) {
          log.w('Token refresh handler failed', error: e, stackTrace: st);
        }
      });
    }
    FirebaseMessaging.onMessage.listen((message) async {
      await _showRemoteMessage(message);
      _refreshByData(message.data);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleNavigation(message);
    });
    final initial = await messaging.getInitialMessage();
    if (initial != null) {
      _handleNavigation(initial);
    }
  }

  Future<void> requestNotificationPermissionIfNeeded() async {
    final asked =
        _localCache.getBool(StorageKeys.notificationsPermissionAsked) ?? false;
    try {
      if (asked) {
        // Permission already asked, check if we have token and re-subscribe if authorized
        final messaging = FirebaseMessaging.instance;
        final settings = await messaging.getNotificationSettings();
        if (settings.authorizationStatus == AuthorizationStatus.authorized ||
            settings.authorizationStatus == AuthorizationStatus.provisional) {
          final existingToken = _localCache.getString(StorageKeys.fcmToken);
          if (existingToken == null || existingToken.isEmpty) {
            // No token stored, try to get one
            await _getTokenAndSubscribe(messaging);
          }
        }
        return;
      }

      final messaging = FirebaseMessaging.instance;
      NotificationSettings settings = await messaging.getNotificationSettings();
      if (settings.authorizationStatus == AuthorizationStatus.denied ||
          settings.authorizationStatus == AuthorizationStatus.notDetermined) {
        settings = await messaging.requestPermission(
          alert: true,
          badge: true,
          sound: true,
          provisional: false,
        );
      }

      if (settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional) {
        await _getTokenAndSubscribe(messaging);
      }
    } on Exception catch (_) {
      log.e('Failed to request notification permission',
          error: _, stackTrace: StackTrace.current);
    }
    await _localCache.saveBool(StorageKeys.notificationsPermissionAsked, true);
  }

  Future<void> _getTokenAndSubscribe(FirebaseMessaging messaging) async {
    bool canRequestToken = true;
    if (Platform.isIOS) {
      final apnsToken = await messaging.getAPNSToken();
      if (apnsToken == null) {
        log.w('iOS APNs token not available yet');
        canRequestToken = false;
      }
    }
    if (canRequestToken) {
      try {
        final token = await messaging.getToken();
        if (token != null) {
          log.i('FCM token obtained: ${token.substring(0, 20)}...');
          await _localCache.saveString(StorageKeys.fcmToken, token);
          await _syncToken(token);
          final String? locale = _localCache.getString(StorageKeys.locale);
          if (locale != null && locale.isNotEmpty) {
            await _subscribeTopicSafe('general-lang-$locale');
          }
          final Map<String, dynamic> songsMap =
              getIt<SongsUserLanguagesHandler>().languages;
          final Map<String, dynamic> bibleMap =
              getIt<BibleStudyUserLanguagesHandler>().languages;
          final Map<String, dynamic> insightsMap =
              getIt<InsightsUserLanguagesHandler>().languages;
          unawaited(syncTopicLangSubscriptionsFor('songbook', songsMap));
          unawaited(syncTopicLangSubscriptionsFor('biblestudy', bibleMap));
          unawaited(syncTopicLangSubscriptionsFor('insights', insightsMap));
          unawaited(_ensureTopicSubscriptionsInitialized());
        } else {
          log.w('FCM token is null after getToken()');
        }
      } catch (e, st) {
        log.e('Failed to get FCM token', error: e, stackTrace: st);
      }
    }
  }

  Future<void> _showRemoteMessage(RemoteMessage message) async {
    final notification = message.notification;
    final android = message.notification?.android;
    if (notification != null) {
      await _local.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(_channelId, 'Notifications',
              channelDescription: 'ICOC',
              icon: android?.smallIcon ?? '@mipmap/launcher_icon',
              importance: Importance.high,
              priority: Priority.high),
          iOS: const DarwinNotificationDetails(),
        ),
        payload: json.encode(message.data),
      );
    }
  }

  void _handleNavigation(RemoteMessage message) {
    final data = message.data;
    _refreshByData(data);
    _navigateByData(data, from: message.from);
  }

  Future<void> _navigateByData(Map<String, dynamic> data,
      {String? from}) async {
    final String topicInData = (data['topic'] ?? '') as String;
    final bool isGeneralTopic = topicInData.startsWith('general') ||
        (from != null && from.contains('/topics/general'));
    if (isGeneralTopic) {
      router.go('/$NOTIFICATIONS_SCREEN');
      return;
    }

    final link = (data['link'] ?? '') as String;
    if (link.isNotEmpty) {
      final uri = Uri.parse(link);
      if (uri.scheme == 'http' || uri.scheme == 'https') {
        router.go('/$NOTIFICATIONS_SCREEN');
        return;
      }
      final target = link.startsWith('/') ? link : '/$link';
      final segments = Uri.parse(target).pathSegments;
      if (segments.isNotEmpty) {
        final first = segments.first;
        switch (first) {
          case 'songbook':
          case 'qanda':
          case 'video':
          case 'biblestudy':
          case 'insights':
          case 'notifications':
          case 'settings':
          case 'shareapp':
          case 'termsofuse':
          case 'aboutapp':
            router.go(target);
            return;
          default:
            router.go('/$NOTIFICATIONS_SCREEN');
            return;
        }
      }
      router.go('/$NOTIFICATIONS_SCREEN');
      return;
    }
    router.go('/$NOTIFICATIONS_SCREEN');
  }

  Future<void> _refreshByData(Map<String, dynamic> data) async {
    getIt<NotificationsBloc>().add(const NotificationsListRequested());
    final link = (data['link'] ?? '') as String;
    if (link.isEmpty) return;
    final uri = Uri.parse(link);
    final segments = (uri.scheme == 'http' || uri.scheme == 'https')
        ? uri.pathSegments
        : Uri.parse(link.startsWith('/') ? link : '/$link').pathSegments;
    if (segments.isEmpty) return;
    switch (segments.first) {
      case 'songbook':
        getIt<SongsBloc>().add(const SongsEvent.songsRequested());
        break;
      case 'qanda':
        getIt<QandABloc>().add(const QandAEvent.requested());
        break;
      case 'video':
        getIt<VideoBloc>().add(const VideoEvent.listRequested());
        break;
      case 'biblestudy':
        getIt<BibleStudyBloc>().add(const BibleStudyEvent.listRequested());
        break;
      case 'insights':
        getIt<InsightsBloc>().add(const InsightsEvent.fetch());
        break;
      default:
        break;
    }
  }

  Future<void> showLocalNotification(
      {required String title, required String body}) async {
    await _local.show(
      _generateNotificationId(),
      title,
      body,
      _soundNotificationDetails,
    );
  }

  Future<void> showLocalNotificationWithSound(
      {required String title, required String body}) async {
    await _local.show(
      _generateNotificationId(),
      title,
      body,
      _soundNotificationDetails,
    );
  }

  Future<void> scheduleLocalNotification(
      {required String id,
      required DateTime scheduleAt,
      required String title,
      required String body}) async {
    await _local.zonedSchedule(
      _deterministicHash(id),
      title,
      body,
      tz.TZDateTime.from(scheduleAt, tz.local),
      _silentNotificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: id,
    );
  }

  Future<void> scheduleLocalNotificationWithSound(
      {required String id,
      required DateTime scheduleAt,
      required String title,
      required String body}) async {
    await _local.zonedSchedule(
      _deterministicHash(id),
      title,
      body,
      tz.TZDateTime.from(scheduleAt, tz.local),
      _soundNotificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: id,
    );
  }

  Future<void> cancelAll() async {
    await _local.cancelAll();
  }

  Future<void> _syncToken(String newToken) async {
    try {
      final String? lang = _localCache.getString(StorageKeys.locale);
      final String? oldToken = _localCache.getString(StorageKeys.fcmToken);

      // Generate a stable device ID using timestamp + random (persists in local storage)
      String? deviceId = _localCache.getString(StorageKeys.deviceId);
      if (deviceId == null || deviceId.isEmpty) {
        deviceId =
            '${DateTime.now().millisecondsSinceEpoch}_${DateTime.now().microsecondsSinceEpoch % 100000}';
        await _localCache.saveString(StorageKeys.deviceId, deviceId);
      }

      final collection = FirebaseFirestore.instance.collection('device_tokens');

      // Delete old token document if token changed (cleanup stale tokens)
      if (oldToken != null && oldToken.isNotEmpty && oldToken != newToken) {
        try {
          await collection.doc(oldToken).delete();
          log.i('Deleted old FCM token document');
        } catch (e) {
          log.w('Failed to delete old token document', error: e);
        }
      }

      // Store new token with device ID for multi-device tracking
      await collection.doc(newToken).set({
        'token': newToken,
        'deviceId': deviceId,
        'platform': Platform.isIOS ? 'ios' : 'android',
        'locale': lang,
        'updatedAt': FieldValue.serverTimestamp(),
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      log.i('FCM token synced to Firestore');
    } catch (e, st) {
      log.e('Failed to sync FCM token to Firestore', error: e, stackTrace: st);
    }
  }

  Future<void> updateLanguageSubscription(String newLocale) async {
    final String? prev = _localCache.getString(StorageKeys.locale);
    if (prev != null && prev.isNotEmpty && prev != newLocale) {
      await _unsubscribeTopicSafe('general-lang-$prev');
    }
    await _subscribeTopicSafe('general-lang-$newLocale');
    await _localCache.saveString(StorageKeys.locale, newLocale);
  }

  Future<void> syncTopicLangSubscriptionsFor(
      String topic, Map<String, dynamic> activeLanguages) async {
    final Map<String, bool> topicStates = await getTopicStates();
    if (topicStates[topic] != true) {
      return;
    }
    final Set<String> toUnsub = activeLanguages.entries
        .where((e) => e.value == false)
        .map((e) => e.key)
        .toSet();
    final Set<String> toSub = activeLanguages.entries
        .where((e) => e.value == true)
        .map((e) => e.key)
        .toSet();
    for (final l in toUnsub) {
      await _unsubscribeTopicSafe('$topic-lang-$l');
    }
    // print('Unsubscribed from $topic, ${toUnsub.toString()}');
    for (final l in toSub) {
      await _subscribeTopicSafe('$topic-lang-$l');
    }
    print('Subscribed to $topic, ${toSub.toString()}');
  }

  Future<void> unsubscribeAllLangsForTopic(String topic) async {
    for (final l in languagesCodes.keys) {
      await _unsubscribeTopicSafe('$topic-lang-$l');
      // print('Unsubscribed from $topic-lang-$l');
    }
  }

  // Topics management
  static final Set<String> _defaultTopics = {
    'songbook',
    'insights',
    'biblestudy',
    'general',
    'updates',
    'qanda',
    'video'
  };

  Future<Map<String, bool>> getTopicStates() async {
    final Map<String, dynamic>? saved =
        _localCache.getMap(StorageKeys.notificationTopics);
    if (saved == null || saved.isEmpty) {
      // Default: subscribe to all topics and persist
      final Map<String, bool> defaults = {
        for (final t in _defaultTopics) t: true,
      };
      await _localCache.saveMap(StorageKeys.notificationTopics, defaults);
      return defaults;
    }
    // Normalize to bool map
    final Map<String, bool> normalized = {
      for (final e in saved.entries)
        e.key: (e.value is bool) ? e.value as bool : (e.value == true),
    };
    // Ensure all defaults exist
    for (final t in _defaultTopics) {
      normalized[t] = normalized[t] ?? true;
    }
    return normalized;
  }

// used fron notifications settings screen
  Future<void> updateTopicSubscription({
    required String topic,
    required bool enabled,
  }) async {
    final Map<String, bool> current = await getTopicStates();
    current[topic] = enabled;
    await _localCache.saveMap(StorageKeys.notificationTopics, current);

    if (enabled) {
      await _subscribeTopicSafe(topic);
      final Map<String, dynamic> langs =
          _getLanguagesMapForTopicFromHandler(topic);
      await syncTopicLangSubscriptionsFor(topic, langs);
    } else {
      await _unsubscribeTopicSafe(topic);
      await unsubscribeAllLangsForTopic(topic);
    }
  }

  Future<void> updateTopicSubscriptions(Set<String> activeTopics) async {
    final Map<String, bool> current = await getTopicStates();
    final Set<String> prevActive =
        current.entries.where((e) => e.value == true).map((e) => e.key).toSet();
    final Set<String> toUnsub = prevActive.difference(activeTopics);
    final Set<String> toSub = activeTopics.difference(prevActive);
    for (final t in toUnsub) {
      await _unsubscribeTopicSafe(t);
    }
    // print('Unsubscribed from $toUnsub');
    for (final t in toSub) {
      await _subscribeTopicSafe(t);
    }
    print('Subscribed to ${toSub.toString()}');
    final Map<String, bool> nextMap = {
      for (final t in activeTopics) t: true,
      for (final t in prevActive.difference(activeTopics)) t: false,
    };
    await _localCache.saveMap(StorageKeys.notificationTopics, nextMap);
  }

//subscribes  on every start
  Future<void> _ensureTopicSubscriptionsInitialized() async {
    final Map<String, bool> states = await getTopicStates();
    for (final entry in states.entries) {
      if (entry.value == true) {
        final Map<String, dynamic> langs =
            _getLanguagesMapForTopicFromHandler(entry.key);
        if (langs.isEmpty) {
          final String? l = _localCache.getString(StorageKeys.locale);
          if (l != null && l.isNotEmpty) {
            await _subscribeTopicSafe('${entry.key}-lang-$l');
          }
        } else {
          for (final e in langs.entries) {
            if (e.value == true) {
              await _subscribeTopicSafe('${entry.key}-lang-${e.key}');
            }
          }
        }
      }
    }
    final String? locale = _localCache.getString(StorageKeys.locale);
    if (locale != null && locale.isNotEmpty) {
      await _subscribeTopicSafe('general-lang-$locale');
    }
  }

  Map<String, dynamic> _getLanguagesMapForTopicFromHandler(String topic) {
    switch (topic) {
      case 'songbook':
        return Map<String, dynamic>.from(
            getIt<SongsUserLanguagesHandler>().languages);
      case 'biblestudy':
        return Map<String, dynamic>.from(
            getIt<BibleStudyUserLanguagesHandler>().languages);
      case 'insights':
        return Map<String, dynamic>.from(
            getIt<InsightsUserLanguagesHandler>().languages);
      default:
        return {};
    }
  }
}
