import 'package:charmin/firebase_options.dart';
import 'package:charmin/utils/print.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await _setupFlutterNotifications();
  // showFlutterNotification(message);
  Print.i(
      '[FCM] Background messageId: ${message.messageId}, message Title: ${message.notification?.title}');
}

class FirebaseMessage {
  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late FirebaseMessaging _messaging;
  bool _isFlutterLocalNotificationsInitialized = false;

  Future<void> init() async {
    _messaging = FirebaseMessaging.instance;

    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
      // save token to server
      Print.i("[FCM] onTokenRefresh: $newToken");
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    if (!kIsWeb) {
      await _setupFlutterNotifications();
    }

    var fcmToken = await _messaging.getToken(
        vapidKey:
            "BPxpg1sdF5yku6ST-HAnpMU5dCUM0f4HNRkVVI9G5KJFSRWHdI6as3QWawamPFXLhyjYAzc49VEW5Si0QVvGdsw");

    FirebaseMessaging.onMessage.listen((event) {
      // Print.i("[FCM] onMessage: ${event.notification?.title}");
      Print.i(
          '[FCM] Foreground messageId: ${event.messageId}, message Title: ${event.notification?.title}');
    });

    Print.i("[FCM] TOKEN : $fcmToken");
  }

  void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            // TODO add a proper drawable resource to android, for now using
            //      one that already exists in example app.
            icon: 'launch_background',
          ),
        ),
      );
    }
  }

  Future iopsRequestPermission() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future<void> _setupFlutterNotifications() async {
    if (_isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    _isFlutterLocalNotificationsInitialized = true;
  }
}
