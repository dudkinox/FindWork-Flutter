// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_ui/Recommendation_List_Data/Recommendation_screen.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Service/JobService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';
import 'package:login_ui/model/jobModel.dart';

import 'favoriteController.dart';

class Favorite extends StatefulWidget {
  Favorite(this.token, this.typeUser);
  var token;
  var typeUser;
  @override
  _FavoriteState createState() => _FavoriteState(token, typeUser);
}

class _FavoriteState extends State<Favorite> {
  _FavoriteState(this.token, this.typeUser);
  var token;
  var typeUser;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  bool loading = false;
  @override
  void initState() {
    super.initState();
  }

  Future<void> onPullToRefresh() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {});
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: RefreshIndicator(
        onRefresh: onPullToRefresh,
        child: Scaffold(
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "ชื่นชอบ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: PrimaryColor,
                              fontSize: 36),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2),
                        TextButton(
                          onPressed: () async {
                            var status = await DelAllFavorite(token);
                            if (status == "ลบสำเร็จ") {
                              setState(() {});
                            }
                          },
                          child: Text(
                            "ล้างทั้งหมด",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Danger,
                                fontSize: 15),
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      // height: MediaQuery.of(context).size.height * 0.72,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: FutureBuilder<List<JobDataModel>>(
                        future: listFavorite(token),
                        builder: (context, AsyncSnapshot snapshot) {
                          List result = [];
                          if (snapshot?.connectionState !=
                              ConnectionState.done) {
                            return LoadingCube();
                          } else {
                            for (JobDataModel data in snapshot?.data) {
                              result.add(Recommendation(
                                  data?.image,
                                  data?.company,
                                  data.province +
                                      " " +
                                      data?.district +
                                      " " +
                                      data?.subDistrict,
                                  data?.id,
                                  token,
                                  typeUser));
                            }
                            loading = false;
                            if (result.length == 0) {
                              return Text(
                                "ไม่มีข้อมูลที่ชื่นชอบ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 15),
                                textAlign: TextAlign.center,
                              );
                            } else {
                              return ListView?.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: result?.length,
                                  itemBuilder: (context, index) {
                                    return result[index];
                                  });
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
