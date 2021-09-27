import 'package:find_a_job_flutter_app/screens/home_screen.dart';
import 'package:find_a_job_flutter_app/screens/homehome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeHome(),
    );
  }
}
