import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:login_ui/main.dart';

Future<void> _showNotification() async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    'nextflow_001',
    'แจ้งเตือนทั่วไป',
    'ก็แจ้ง',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );
  const NotificationDetails plateformChanelDetail = NotificationDetails(
    android: androidNotificationDetails,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'แจ้งเตือนสมัครงาน',
    'บริษัทเสริมไทยรับคุณเข้าทำงานแล้ว',
    plateformChanelDetail,
  );
}
