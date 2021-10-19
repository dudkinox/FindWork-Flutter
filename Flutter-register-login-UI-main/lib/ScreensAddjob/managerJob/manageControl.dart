import 'package:flutter/material.dart';
import 'package:login_ui/Screens/alertPage/infinite.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'manageJob.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key key}) : super(key: key);

  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  final InfiniteScrollController _infiniteController = InfiniteScrollController(
    initialScrollOffset: 0.0,
  );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('หน้าจัดการผู้สมัคร'),
          centerTitle: true,
          backgroundColor: HeaderColor,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'จัดการผู้ใช้'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Manager(),
          ],
        ),
      ),
    );
  }
}
