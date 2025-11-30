import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/routes/app_routes.dart';
import 'package:icoc/core/routes/app_router.dart';

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
  }

  Future<void> _initLocalNotifications() async {
    const AndroidInitializationSettings androidInit =
        AndroidInitializationSettings('@mipmap/launcher_icon');
    final DarwinInitializationSettings iosInit =
        const DarwinInitializationSettings();
    final InitializationSettings initSettings =
        InitializationSettings(android: androidInit, iOS: iosInit);
    await _local.initialize(initSettings,
        onDidReceiveNotificationResponse: (details) {
      router.push(NOTIFICATIONS_SCREEN);
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
      });
    }
    FirebaseMessaging.onMessage.listen((message) async {
      await _showRemoteMessage(message);
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
    router.push(NOTIFICATIONS_SCREEN);
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
}
