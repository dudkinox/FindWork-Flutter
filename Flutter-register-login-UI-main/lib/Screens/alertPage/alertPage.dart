import 'package:flutter/material.dart';
import 'package:login_ui/Screens/alertPage/notifyPage.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Service/MessageService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/model/messageModel.dart';

class AlertPage extends StatefulWidget {
  AlertPage(this.token);
  var token;
  @override
  _AlertPageState createState() => _AlertPageState(token);
}

class _AlertPageState extends State<AlertPage> {
  _AlertPageState(this.token);
  var token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แจ้งเตือน'),
        backgroundColor: PrimaryColor,
      ),
      body: FutureBuilder<dynamic>(
          future: GetMessage(token),
          builder: (context, AsyncSnapshot snapshot) {
            List result = [];
            if (snapshot?.connectionState != ConnectionState.done) {
              return LoadingCube();
            } else {
              if (snapshot.data != "หาไม่เจอ") {
                for (MessageModel data in snapshot?.data) {
                  result.add(notifyPage(
                      data?.image, data?.message, data?.company, data?.lineID));
                }
              }
              if (result.length == 0) {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverFillRemaining(
                      child: Container(
                        child: Center(
                          child: Text("ไม่พบข้อมูล",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 23)),
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    itemCount: result?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8),
                        child: result[index],
                      );
                    },
                  ),
                );
              }
            }
          }),
    );
  }
}
