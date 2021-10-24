// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Screens/profile/ProfileController.dart';
import 'package:login_ui/Themes/Themes.dart';

class Welcome extends StatelessWidget {
  Welcome(this.token, this.fullname);
  String token;
  TextEditingController fullname;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FlutterSession().get('token'),
      builder: (context, snapshot) {
        token = snapshot.data;
        return FadeAnimation(
          1.1,
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<TextEditingController>(
                    future: datafullname(snapshot.data.toString()),
                    builder: (context, AsyncSnapshot snapshot) {
                      if(snapshot.connectionState == ConnectionState.done){
                        fullname = snapshot?.data;
                        return Text(
                          "สวัสดี, " + fullname?.text ?? "กำลังโหลด...",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                              fontSize: 20.0),
                        );
                      } else {
                        return LoadingRipple();
                      }
                    }),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "คุณต้องการค้นหางานที่ไหน?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: PrimaryColor,
                      fontSize: 20.0),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
