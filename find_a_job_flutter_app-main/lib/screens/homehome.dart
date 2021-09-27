import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:find_a_job_flutter_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class HomeHome extends StatefulWidget {
  @override
  _HomeHomeState createState() => _HomeHomeState();
}

class _HomeHomeState extends State<HomeHome> {
  int newindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.orange,
        index: 0,
        backgroundColor: Colors.white,
        items: <Widget>[
          Icon(
            Icons.home_outlined,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.date_range_outlined,
            color: Colors.white,
            size: 30.0,
          ),
          Icon(
            Icons.approval,
            color: Colors.white,
            size: 30.0,
          ),
          Icon(
            Icons.person_outline,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            newindex = index;
          });
        },
      ),
      body: newindex == 0 ? HomePage() : null,
    );
  }
}
