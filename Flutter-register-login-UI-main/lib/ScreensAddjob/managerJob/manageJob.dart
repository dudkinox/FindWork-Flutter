import 'package:flutter/material.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Service/ProgressService.dart';
import 'package:login_ui/components/WillPop.dart';
import 'package:login_ui/model/ProgressModel.dart';
import 'package:login_ui/model/loginModel.dart';
import 'manageCard.dart';

class Manager extends StatefulWidget {
  Manager(this.id,this.name,this.token);
  var id;
  var name;
  var token;
  @override
  _ManagerState createState() => _ManagerState(id,name,token);
}

class _ManagerState extends State<Manager> {
  _ManagerState(this.id,this.name,this.token);
  var id;
  var name;
  var token;
  Future<void> onPullToRefresh() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AccountModel>>(
        future: RegisProgress(id),
        builder: (context, AsyncSnapshot snapshot) {
          List result = [];
          if (snapshot?.connectionState != ConnectionState.done) {
            return LoadingCube();
          } else {
            for (AccountModel data in snapshot?.data) {
              result.add(Itemcard(data?.email, data?.fullname, data?.tel,name,data?.id,id,token));
            }
            if (result.length == 0) {
              return RefreshIndicator(
                onRefresh: onPullToRefresh,
                child: CustomScrollView(
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
                ),
              );
            } else {
              return RefreshIndicator(
                onRefresh: onPullToRefresh,
                child: Padding(
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
                ),
              );
            }
          }
        });
  }
}
