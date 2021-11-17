import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:login_ui/main.dart';

Future<void> showNotification(String company, String name) async {
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
    'ยื่นสมัครงาน ' + company + ' ตำแหน่ง ' + name + ' แล้ว!',
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

Future<void> MessageNotification() async {
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
    'มีข้อความเข้า 1 ข้อความ',
    plateformChanelDetail,
  );
}
