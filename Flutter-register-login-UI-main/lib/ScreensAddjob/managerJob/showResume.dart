import 'package:flutter/material.dart';
import 'package:login_ui/Screens/loading.dart';
import 'package:login_ui/Service/LoginService.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/WillPop.dart';
import 'package:login_ui/components/image.dart';
import 'package:login_ui/model/loginModel.dart';

class showResume extends StatefulWidget {
  showResume(this.token);
  var token;
  @override
  _showResumeState createState() => _showResumeState(token);
}

class _showResumeState extends State<showResume> {
  _showResumeState(this.token);
  var token;
  final double minScale = 1;
  final double maxScale = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "เรซูเม่",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: PrimaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: FutureBuilder<ResumeModel>(
            future: PreviewResume(token),
            builder: (context, snapshot) {
              if (snapshot?.connectionState == ConnectionState.done) {
                if (snapshot.data?.link == "") {
                  return Container(
                    child: Center(
                      child: Text("ไม่พบรูปภาพเรซูเม่",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 23)),
                    ),
                  );
                } else {
                  return InteractiveViewer(
                      clipBehavior: Clip.none,
                      panEnabled: false,
                      minScale: minScale,
                      maxScale: maxScale,
                      child: AspectRatio(
                          aspectRatio: 1,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(snapshot.data?.link,
                                  fit: BoxFit.cover))));
                }
              } else {
                return LoadingRipple();
              }
            }),
      ),
    );
  }
}
