import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
//import 'dart:io' show Platform;


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = 
  FlutterLocalNotificationsPlugin();


Future<void> initNotifications() async {
  final androidPlugin = flutterLocalNotificationsPlugin
    .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

  final granted = await androidPlugin?.requestExactAlarmsPermission();
  if (granted != true) {
    print('❌ Permiso de notificaciones NO concedido');
  } else {
    print('✅ Permiso de notificaciones concedido');
  }

  tz.initializeTimeZones();
  final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(currentTimeZone));

  const initializationSettingsAndroid = AndroidInitializationSettings('iconnotification');

  const initializationSettingsIOS = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true
  );

  const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}


NotificationDetails notificationDetails(){
  return const NotificationDetails(
    android: AndroidNotificationDetails(
      'canal_1',
      'Canal General',
      channelDescription: 'Canal para notificaciones estándar',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    ),
    iOS: DarwinNotificationDetails(),
  );
}

Future<void> showNotification({
  required int id,
  required String title,
  required String body,
}) async {

  await flutterLocalNotificationsPlugin.show(
    id,     // cada notificación debe tener un ID único
    title,  // título de la notificación
    body,   // cuerpo de la notificación
    notificationDetails(),
  );
}


Future<void> scheduleNotification({
  int id = 1,
  required String title,
  required String body, 
  required int hour,
  required int minute, 
  required String payLoad,
}) async {

  final now = tz.TZDateTime.now(tz.local);

  /*var scheduleDate = tz.TZDateTime(
    tz.local,
    now.year,
    now.month,
    now.day,
    hour,
    minute,
  );

  if (scheduleDate.isBefore(now)) {
    scheduleDate = tz.TZDateTime.now(tz.local).add(Duration(seconds: 10));
  }*/

  var scheduleDate = tz.TZDateTime.now(tz.local).add(Duration(seconds: 10));

  await flutterLocalNotificationsPlugin.zonedSchedule(
    id, 
    title, 
    body, 
    scheduleDate, 
    notificationDetails(),
    androidScheduleMode: AndroidScheduleMode.exact,
    payload: payLoad,
    matchDateTimeComponents: DateTimeComponents.time,
  );

  print("Hora actual del emulador (zonalocal): $now");
  //await flutterLocalNotificationsPlugin.show(id, title, body, notificationDetails)
}

Future<void> cancelAllNotifications() async{
  await flutterLocalNotificationsPlugin.cancelAll();
}