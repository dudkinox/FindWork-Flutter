import 'package:flutter/material.dart';
import 'Screens/login/login.dart';
import 'Themes/Themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'แอปพลิเคชันหางานใกล้คุณ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: PrimaryColor,
        scaffoldBackgroundColor: NoneColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}
