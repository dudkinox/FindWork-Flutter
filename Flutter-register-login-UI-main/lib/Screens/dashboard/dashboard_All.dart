// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_ui/Recommendation_List_Data/Recommendation_screen.dart';
import 'package:login_ui/SelectCheckbox/choices.dart';
import 'package:login_ui/Service/JobService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';
import 'package:login_ui/model/jobModel.dart';
import '../homehome.dart';
import '../loading.dart';
import 'dashboard_itemCard.dart';

class dashboard_All extends StatefulWidget {
  dashboard_All(this.token, this.typeUser);
  var token;
  var typeUser;
  @override
  _dashboard_AllState createState() => _dashboard_AllState(token, typeUser);
}

class _dashboard_AllState extends State<dashboard_All> {
  _dashboard_AllState(this.token, this.typeUser);
  var token;
  var typeUser;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "หางานทั้งหมด",
            style: TextStyle(
              color: SecondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => HomeHome(0, token, typeUser))),
            },
          ),
        ),
        body: Container(
          child: FutureBuilder<List<JobDataModel>>(
              future: TopicWork(),
              builder: (context, AsyncSnapshot snapshot) {
                List result = [];
                if (snapshot?.connectionState != ConnectionState.done) {
                  return LoadingCube();
                } else {
                  for (var data in snapshot?.data) {
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
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: result.length,
                    itemBuilder: (context, index) {
                      return result[index];
                    },
                  );
                }
              }),
        ),
      ),
    );
  }
}
