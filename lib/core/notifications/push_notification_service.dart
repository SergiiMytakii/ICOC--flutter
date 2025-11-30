import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
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
          }
        } catch (_) {
          // Ignore token acquisition failures so app can continue startup
        }
      }
      FirebaseMessaging.instance.onTokenRefresh.listen((t) async {
        await _localCache.saveString(StorageKeys.fcmToken, t);
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
}
