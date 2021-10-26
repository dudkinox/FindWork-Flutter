import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:login_ui/main.dart';

Future<void> showNotification() async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    'NBB Part-time',
    'แจ้งเตือนสำคัญ',
    'แจ้งเตือนสำคัญ',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );
  const NotificationDetails plateformChanelDetail = NotificationDetails(
    android: androidNotificationDetails,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'NBB Part-time',
    'ยื่นสมัครงาน บริษัทรับเหมา ตำแหน่ง youtuber แล้ว!',
    plateformChanelDetail,
  );
}

Future<void> updaetJobNotification() async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    'NBB Part-time',
    'แจ้งเตือนสำคัญ',
    'แจ้งเตือนสำคัญ',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );
  const NotificationDetails plateformChanelDetail = NotificationDetails(
    android: androidNotificationDetails,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'NBB Part-time',
    'ท่านได้อัพเดทรายละเอียดงานเป็นอันล่าสุดแล้ว!',
    plateformChanelDetail,
  );
}
