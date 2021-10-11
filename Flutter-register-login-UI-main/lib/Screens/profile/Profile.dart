import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';
import 'package:login_ui/Controller/LoginController.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/alert.dart';
import 'package:login_ui/model/loginModel.dart';

import 'ProfileController.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);
  final TextEditingController fullname = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController tel = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController confirmpassword = new TextEditingController();
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  var fullname = new TextEditingController();
  var email = new TextEditingController();
  var tel = new TextEditingController();
  var password = new TextEditingController();
  var confirmpassword = new TextEditingController();
  String token = "";

  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      color: Colors.white,
      child: new ListView(
        children: <Widget>[
          FutureBuilder(
              future: FlutterSession().get('token'),
              builder: (context, snapshot) {
                print("token => " + snapshot.data.toString());
                // DataProfile(snapshot.data.toString());
                token = snapshot.data;
                return FadeAnimation(
                  1.0,
                  Column(
                    children: <Widget>[
                      new Container(
                        height: 250.0,
                        color: Colors.white,
                        child: new Column(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(left: 25.0),
                                      child: new Text('ข้อมูลส่วนตัว',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0,
                                              fontFamily: 'sans-serif-light',
                                              color: PrimaryColor)),
                                    )
                                  ],
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: new Stack(
                                  fit: StackFit.loose,
                                  children: <Widget>[
                                    new Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        new Container(
                                            width: 140.0,
                                            height: 140.0,
                                            decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                image: new ExactAssetImage(
                                                    'assets/images/as.png'),
                                                fit: BoxFit.cover,
                                              ),
                                            )),
                                      ],
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 90.0, right: 100.0),
                                        child: new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            new CircleAvatar(
                                              backgroundColor: PrimaryColor,
                                              radius: 25.0,
                                              child: new Icon(
                                                Icons.camera_alt,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        )),
                                  ]),
                            )
                          ],
                        ),
                      ),
                      new Container(
                        color: Color(0xffFFFFFF),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'แก้ไขข้อมูล',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: PrimaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          _status
                                              ? _getEditIcon()
                                              : new Container(),
                                        ],
                                      )
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'ชื่อ',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: PrimaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Flexible(
                                        child: FutureBuilder<
                                            TextEditingController>(
                                          future: datafullname(
                                              snapshot.data.toString()),
                                          builder: (context, snapshot) {
                                            fullname = snapshot.data;
                                            return new TextField(
                                              controller: fullname,
                                              decoration: const InputDecoration(
                                                hintText: "ใส่ชื่อของคุณ",
                                              ),
                                              enabled: !_status,
                                              autofocus: !_status,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'ชื่ออีเมล์',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: PrimaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Flexible(
                                          child: FutureBuilder<
                                                  TextEditingController>(
                                              future: dataemail(
                                                  snapshot.data.toString()),
                                              builder: (context, snapshot) {
                                                email = snapshot.data;
                                                return new TextField(
                                                  controller: email,
                                                  decoration:
                                                      const InputDecoration(
                                                          hintText:
                                                              "ป้อน ID อีเมล"),
                                                  enabled: !_status,
                                                );
                                              })),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'เบอร์โทรศัพท์',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: PrimaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Flexible(
                                          child: FutureBuilder<
                                                  TextEditingController>(
                                              future: datatel(
                                                  snapshot.data.toString()),
                                              builder: (context, snapshot) {
                                                tel = snapshot.data;
                                                return new TextField(
                                                  controller: tel,
                                                  decoration:
                                                      const InputDecoration(
                                                          hintText:
                                                              "ใส่เบอร์โทรศัพท์"),
                                                  enabled: !_status,
                                                );
                                              })),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'ตั้งรหัสผ่านใหม่',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: PrimaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Flexible(
                                        child: new TextField(
                                          obscureText: true,
                                          controller: password,
                                          decoration: const InputDecoration(
                                              hintText: "ตั้งรหัสผ่านใหม่"),
                                          enabled: !_status,
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'ยืนยัน ตั้งรหัสผ่านใหม่',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: PrimaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Flexible(
                                        child: new TextField(
                                          obscureText: true,
                                          controller: confirmpassword,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "ยืนยันตั้งรหัสผ่านใหม่"),
                                          enabled: !_status,
                                        ),
                                      ),
                                    ],
                                  )),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: RaisedButton(
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(80.0)),
                                  textColor: Colors.white,
                                  padding: const EdgeInsets.all(0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    decoration: new BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(80.0),
                                        gradient: new LinearGradient(colors: [
                                          PrimaryColor,
                                          PrimaryColor,
                                        ])),
                                    padding: const EdgeInsets.all(0),
                                    child: GestureDetector(
                                      onTap: () => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfilePage()))
                                      },
                                      child: Text(
                                        "เพื่มเรซุเม่",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 15.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[],
                                  )),
                              !_status ? _getActionButtons() : new Container(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Save"),
                textColor: Colors.white,
                color: Color(0xFF25888E),
                onPressed: () async {
                  print(token);
                  if (password.text == confirmpassword.text) {
                    final String status = await UpdateProfile(email.text,
                        fullname.text, tel.text, password.text, token);
                    print(status);

                    if (status == "แก้ไขข้อมูลแล้ว") {
                      showDialog(
                          context: context,
                          builder: (_) => AlertMessage(
                              "แจ้งเตือน", "แก้ไขข้อมูลสำเร็จ", null));
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertMessage(
                              "แจ้งเตือน",
                              "Server มีปัญหา ปิดปรับปรุงชั่วคราว กรุณาลองใหม่ภายหลัง",
                              null));
                    }
                    setState(() {
                      _status = true;
                      FocusScope.of(context).requestFocus(new FocusNode());
                    });
                  } else {
                    showDialog(
                          context: context,
                          builder: (_) => AlertMessage(
                              "แจ้งเตือน",
                              "กรอกกรหัสให้ตรงกัน",
                              null));
                  }
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancel"),
                textColor: Colors.white,
                color: Colors.red[600],
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: PrimaryColor,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
