import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:login_ui/main.dart';

Future<void> showNotification() async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    'NBB Part-time',
    'แจ้งเตือน',
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
    'แจ้งเตือนสมัครงาน',
    'ยื่นสมัครงาน บริษัทรับเหมา ตำแหน่ง youtuber แล้ว!',
    plateformChanelDetail,
  );
}
