import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:icoc/presentation/bloc/insights/insights_event.dart';
import 'package:injectable/injectable.dart';
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
import 'package:url_launcher/url_launcher.dart';
import 'package:icoc/domain/model/notifications/notification_topic.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

@LazySingleton()
class PushNotificationService {
  PushNotificationService(this._localCache);

  final LocalCache _localCache;
  final FlutterLocalNotificationsPlugin _local =
      FlutterLocalNotificationsPlugin();
  static const String _channelId = 'icoc_default_channel';

  Future<void> initialize() async {
    tz.initializeTimeZones();
    await _initLocalNotifications();
    await _initFCM();
    await _ensureTopicSubscriptionsInitialized();
  }

  Future<void> _initLocalNotifications() async {
    const AndroidInitializationSettings androidInit =
        AndroidInitializationSettings('@mipmap/launcher_icon');
    final DarwinInitializationSettings iosInit =
        const DarwinInitializationSettings();
    final InitializationSettings initSettings =
        InitializationSettings(android: androidInit, iOS: iosInit);
    await _local.initialize(initSettings,
        onDidReceiveNotificationResponse: (details) async {
      final payload = details.payload;
      if (payload != null && payload.isNotEmpty) {
        try {
          final data = json.decode(payload) as Map<String, dynamic>;
          await _navigateByData(data);
          await _refreshByData(data);
          return;
        } catch (_) {}
      }
      router.go(NOTIFICATIONS_SCREEN);
    });
    await _local
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
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
  }

  Future<void> _initFCM() async {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    final messaging = FirebaseMessaging.instance;
    final settings = await messaging.requestPermission(
        alert: true, badge: true, sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      bool canRequestToken = true;
      if (Platform.isIOS) {
        final apnsToken = await messaging.getAPNSToken();
        if (apnsToken == null) {
          canRequestToken = false;
        }
      }
      if (canRequestToken) {
        try {
          final token = await messaging.getToken();
          if (token != null) {
            await _localCache.saveString(StorageKeys.fcmToken, token);
            await _syncToken(token);
            await messaging.subscribeToTopic('news');
            final String? locale = _localCache.getString(StorageKeys.locale);
            if (locale != null && locale.isNotEmpty) {
              await messaging.subscribeToTopic('lang-$locale');
            }
            // Subscribe to persisted notification topics (default: all)
            await _ensureTopicSubscriptionsInitialized();
          }
        } catch (_) {
          // Ignore token acquisition failures so app can continue startup
        }
      }
      FirebaseMessaging.instance.onTokenRefresh.listen((t) async {
        await _localCache.saveString(StorageKeys.fcmToken, t);
        await _syncToken(t);
        await FirebaseMessaging.instance.subscribeToTopic('news');
        final String? locale = _localCache.getString(StorageKeys.locale);
        if (locale != null && locale.isNotEmpty) {
          await FirebaseMessaging.instance.subscribeToTopic('lang-$locale');
        }
        await _ensureTopicSubscriptionsInitialized();
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
    _navigateByData(data);
    _refreshByData(data);
  }

  Future<void> _navigateByData(Map<String, dynamic> data) async {
    final link = (data['link'] ?? '') as String;
    if (link.isNotEmpty) {
      final uri = Uri.parse(link);
      if (uri.scheme == 'http' || uri.scheme == 'https') {
        final path = uri.path.startsWith('/') ? uri.path : '/${uri.path}';
        final target = uri.hasQuery ? '$path?${uri.query}' : path;
        router.go(target);
        return;
      }
      router.go(link);
      return;
    }
    router.go(NOTIFICATIONS_SCREEN);
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
      DateTime.now().millisecondsSinceEpoch % 1000000,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(_channelId, 'Notifications',
            channelDescription: 'ICOC',
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/launcher_icon'),
        iOS: DarwinNotificationDetails(),
      ),
    );
  }

  Future<void> scheduleLocalNotification(
      {required String id,
      required DateTime scheduleAt,
      required String title,
      required String body}) async {
    await _local.zonedSchedule(
      id.hashCode,
      title,
      body,
      tz.TZDateTime.from(scheduleAt, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(_channelId, 'Notifications',
            channelDescription: 'ICOC',
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/launcher_icon'),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: id,
    );
  }

  Future<void> cancelAll() async {
    await _local.cancelAll();
  }

  Future<void> _syncToken(String token) async {
    final String? lang = _localCache.getString(StorageKeys.locale);
    final doc =
        FirebaseFirestore.instance.collection('device_tokens').doc(token);
    await doc.set({
      'token': token,
      'platform': Platform.isIOS ? 'ios' : 'android',
      'locale': lang,
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<void> updateLanguageSubscription(String newLocale) async {
    final String? prev = _localCache.getString(StorageKeys.locale);
    if (prev != null && prev.isNotEmpty && prev != newLocale) {
      await FirebaseMessaging.instance.unsubscribeFromTopic('lang-$prev');
    }
    await FirebaseMessaging.instance.subscribeToTopic('lang-$newLocale');
    await _localCache.saveString(StorageKeys.locale, newLocale);
  }

  Future<void> updateLanguageSubscriptions(Set<String> activeLocales) async {
    final Map<String, dynamic> prevMap =
        _localCache.getMap(StorageKeys.notificationLangs) ?? {};
    final Set<String> prevActive =
        prevMap.entries.where((e) => e.value == true).map((e) => e.key).toSet();
    final Set<String> toUnsub = prevActive.difference(activeLocales);
    final Set<String> toSub = activeLocales.difference(prevActive);
    for (final l in toUnsub) {
      await FirebaseMessaging.instance.unsubscribeFromTopic('lang-$l');
    }
    for (final l in toSub) {
      await FirebaseMessaging.instance.subscribeToTopic('lang-$l');
    }
    final Map<String, dynamic> nextMap = {
      for (final l in activeLocales) l: true,
      for (final l in prevActive.difference(activeLocales)) l: false,
    };
    await _localCache.saveMap(StorageKeys.notificationLangs, nextMap);
  }

  // Topics management
  static final Set<String> _defaultTopics = {
    'songbook',
    'insights',
    'biblestudy',
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

  Future<void> updateTopicSubscription({
    required String topic,
    required bool enabled,
  }) async {
    if (enabled) {
      await FirebaseMessaging.instance.subscribeToTopic(topic);
    } else {
      await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
    }
    final Map<String, bool> current = await getTopicStates();
    current[topic] = enabled;
    await _localCache.saveMap(StorageKeys.notificationTopics, current);
  }

  Future<void> updateTopicSubscriptions(Set<String> activeTopics) async {
    final Map<String, bool> current = await getTopicStates();
    final Set<String> prevActive = current.entries
        .where((e) => e.value == true)
        .map((e) => e.key)
        .toSet();
    final Set<String> toUnsub = prevActive.difference(activeTopics);
    final Set<String> toSub = activeTopics.difference(prevActive);
    for (final t in toUnsub) {
      await FirebaseMessaging.instance.unsubscribeFromTopic(t);
    }
    for (final t in toSub) {
      await FirebaseMessaging.instance.subscribeToTopic(t);
    }
    final Map<String, bool> nextMap = {
      for (final t in activeTopics) t: true,
      for (final t in prevActive.difference(activeTopics)) t: false,
    };
    await _localCache.saveMap(StorageKeys.notificationTopics, nextMap);
  }

  Future<void> _ensureTopicSubscriptionsInitialized() async {
    final Map<String, bool> states = await getTopicStates();
    for (final entry in states.entries) {
      if (entry.value == true) {
        await FirebaseMessaging.instance.subscribeToTopic(entry.key);
      }
    }
  }
}
