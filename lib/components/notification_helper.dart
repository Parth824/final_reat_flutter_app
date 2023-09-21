import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationHelper {
  NotificationHelper._();

  static final NotificationHelper notificationHelper = NotificationHelper._();

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // TODO :initlialize

  NotificationInitialize() async {
    //
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('mipmap/ic_launcher');

    //
    DarwinInitializationSettings darwinInitializationSettings =
        const DarwinInitializationSettings(
            requestAlertPermission: true,
            requestSoundPermission: true,
            defaultPresentAlert: true,
            defaultPresentBadge: true,
            requestBadgePermission: true,
            defaultPresentSound: true);

    //
    InitializationSettings initializationSettings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: darwinInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (details) {
      print('----------------');
      print('${details.payload}');
      print('----------------');
    });
  }

// TODO :Simple

  SimpleNotification(
      {required int id, required String name, required String body}) async {
    //
    print('hello');
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails('1', 'dummy Simple Notification');
    //
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails();
    //
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);
    //
    await flutterLocalNotificationsPlugin.show(
        id, name, body, notificationDetails,
        payload: 'This Is Simple Notification');
    print('hello');
  }

  // TODO: ScheduledNotification
  ScheduledNotification() async {
    //
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails('1', 'dummy Simple Notification');
    //
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails();
    //
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);
    //
    await flutterLocalNotificationsPlugin.periodicallyShow(1, "Parth",
        "Dhameliya", RepeatInterval.weekly, notificationDetails);
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String description,
  }) async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.local);
    var currentDateTime =
        tz.TZDateTime.now(tz.local).add(Duration(minutes: 1));
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      description,
      currentDateTime,
      NotificationDetails(
        // Android details
        android: AndroidNotificationDetails('main_channel', 'Main Channel',
            channelDescription: "ashwin",
            importance: Importance.max,
            priority: Priority.max),
        // iOS details
        iOS: DarwinNotificationDetails(),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation
              .absoluteTime, //To show notification even when the app is closed
      androidAllowWhileIdle: true,
    );
  }

  deleteNotifiacation() async {
    await flutterLocalNotificationsPlugin.cancel(1);
  }
}
