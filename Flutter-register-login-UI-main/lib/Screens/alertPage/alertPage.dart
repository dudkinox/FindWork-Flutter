import 'package:flutter/material.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';

import 'infinite.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  final InfiniteScrollController _infiniteController = InfiniteScrollController(
    initialScrollOffset: 0.0,
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('แจ้งเตือน'),
            backgroundColor: PrimaryColor,
            bottom: const TabBar(
              tabs: <Widget>[Tab(text: 'การตอบกลับ')],
            ),
          ),
          body: FadeAnimation(
            1.0,
            TabBarView(
              children: <Widget>[
                _buildTab(0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTab(int tab) {
    return InfiniteListView.separated(
      key: PageStorageKey(tab),
      controller: _infiniteController,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          child: InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('แจ้งเตือน ข้อความที่ $index'),
              subtitle: Text('การตอบกลับที่ $index'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(height: 2.0),
      anchor: 0.5,
    );
  }
}
