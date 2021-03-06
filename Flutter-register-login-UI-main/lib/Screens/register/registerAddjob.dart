// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:login_ui/SelectCheckbox/smart_select.dart';
import 'package:login_ui/Service/JobService.dart';
import 'package:login_ui/Service/LoginService.dart';

import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/alert.dart';
import 'package:login_ui/components/background.dart';
import 'package:login_ui/main.dart';
import 'package:login_ui/model/loginModel.dart';
import '../../SelectCheckbox/choices.dart' as choices;

class RegisterAddjobScreen extends StatefulWidget {
  @override
  _RegisterAddjobScreenState createState() => _RegisterAddjobScreenState();
}

class _RegisterAddjobScreenState extends State<RegisterAddjobScreen> {
  final username = GlobalKey<FormState>();
  final password = GlobalKey<FormState>();
  final confirmpassword = GlobalKey<FormState>();
  final fullname = GlobalKey<FormState>();
  final job_id = GlobalKey<FormState>();
  final email = GlobalKey<FormState>();
  final tel = GlobalKey<FormState>();

  List<String> _smartphone = [];

  RegisterInputModelEmployer register = RegisterInputModelEmployer();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "สมัครสมาชิก",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF31B4BC),
                      fontSize: 36),
                  textAlign: TextAlign.left,
                ),
              ),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  key: username,
                  child: TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.account_circle_outlined),
                        labelText: "ชื่อผู้ใช้"),
                    onSaved: (String username) {
                      register.username = username;
                    },
                  ),
                ),
              ),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  key: password,
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key_outlined),
                      labelText: "รหัสผ่าน",
                    ),
                    obscureText: true,
                    onSaved: (String password) {
                      register.password = password;
                    },
                  ),
                ),
              ),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  key: confirmpassword,
                  child: TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key_outlined),
                        labelText: "ยืนยันรหัสผ่าน"),
                    obscureText: true,
                    onSaved: (String confirmpassword) {
                      register.confirmpassword = confirmpassword;
                    },
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Text(
                  "ข้อมูลบริษัท",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF31B4BC),
                      fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  key: fullname,
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.location_city_outlined),
                      labelText: "ชื่อบริษัท",
                    ),
                    onSaved: (String fullname) {
                      register.fullname = fullname;
                    },
                  ),
                ),
              ),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  key: job_id,
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.badge_outlined),
                      labelText: "เลขประจำตัวผู้เสียภาษีอากร",
                    ),
                    onSaved: (String job_id) {
                      register.job_id = job_id;
                    },
                  ),
                ),
              ),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  key: email,
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle_outlined),
                      labelText: "อีเมลบริษัท",
                    ),
                    onSaved: (String email) {
                      register.email = email;
                    },
                  ),
                ),
              ),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  key: tel,
                  child: TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.call_outlined),
                        labelText: "เบอร์โทรศัพท์"),
                    onSaved: (String tel) {
                      register.tel = tel;
                    },
                  ),
                ),
              ),
              // matching
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: <Widget>[
                    const Divider(indent: 20),
                    SmartSelect<String>.multiple(
                      title: 'ประเภทงานที่รับสมัคร',
                      selectedValue: _smartphone,
                      onChange: (selected) {
                        setState(() => _smartphone = selected.title);
                      },
                      choiceType: S2ChoiceType.chips,
                      choiceItems: S2Choice.listFrom<String, Map>(
                        source: choices.smartphones,
                        value: (index, item) => item['id'],
                        title: (index, item) => item['name'],
                      ),
                      choiceStyle: S2ChoiceStyle(outlined: true),
                      choiceActiveStyle: S2ChoiceStyle(outlined: true),
                      modalConfig: S2ModalConfig(
                        type: S2ModalType.bottomSheet,
                        useFilter: true,
                        maxHeightFactor: .7,
                      ),
                      tileBuilder: (context, state) {
                        return S2Tile.fromState(
                          state,
                          isTwoLine: true,
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: RaisedButton(
                  onPressed: () async {
                    try {
                      username.currentState.save();
                      password.currentState.save();
                      confirmpassword.currentState.save();
                      email.currentState.save();
                      tel.currentState.save();
                      job_id.currentState.save();
                      fullname.currentState.save();
                      if (register.username == "") {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertMessage(
                                "แจ้งเตือน", "กรุณากรอกบัญชีผู้ใช้", null));
                      } else {
                        if (register.password == "") {
                          showDialog(
                              context: context,
                              builder: (_) => AlertMessage(
                                  "แจ้งเตือน", "กรุณากรอกรหัสผ่าน", null));
                        } else {
                          if (register.fullname == "") {
                            showDialog(
                                context: context,
                                builder: (_) => AlertMessage(
                                    "แจ้งเตือน", "กรุณากรอกชื่อบริษัท", null));
                          } else {
                            if (register.job_id == "") {
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertMessage("แจ้งเตือน",
                                      "กรุณากรอกเลขประจำตัวผู้เสียภาษี", null));
                            } else {
                              if (register.email == "") {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertMessage(
                                        "แจ้งเตือน", "กรุณากรอกอีเมล", null));
                              } else {
                                if (register.tel == "") {
                                  showDialog(
                                      context: context,
                                      builder: (_) => AlertMessage("แจ้งเตือน",
                                          "กรุณากรอกเบอร์โทรศัพท์", null));
                                } else {
                                  if (register.password !=
                                      register.confirmpassword) {
                                    showDialog(
                                        context: context,
                                        builder: (_) => AlertMessage(
                                            "แจ้งเตือน",
                                            "กรอกรหัสผ่านไม่ตรงกัน",
                                            null));
                                  } else {
                                    if (_smartphone.length <= 0) {
                                      showDialog(
                                        context: context,
                                        builder: (_) => AlertMessage(
                                            "แจ้งเตือน",
                                            "กรุณาเลือกประเภทงานที่รับสมัคร",
                                            null),
                                      );
                                    } else {
                                      username.currentState.reset();
                                      password.currentState.reset();
                                      confirmpassword.currentState.reset();
                                      fullname.currentState.reset();
                                      job_id.currentState.reset();
                                      email.currentState.reset();
                                      tel.currentState.reset();
                                      final String status =
                                          await RegisterEmployer(
                                              register.email,
                                              register.fullname,
                                              register.job_id,
                                              register.tel,
                                              register.username,
                                              register.password,
                                              _smartphone);
                                      if (status == "เพิ่มบัญชีสำเร็จ") {
                                        final String result = await JobCrate(
                                            register.job_id, register.fullname);
                                        if (result == "เพิ่มงานสำเร็จ") {
                                          showDialog(
                                            context: context,
                                            builder: (_) => AlertMessage(
                                                "แจ้งเตือน",
                                                "สมัครสามาชิกรเรียบร้อยแล้ว",
                                                MyApp()),
                                          );
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (_) => AlertMessage(
                                                "แจ้งเตือน",
                                                "การสมัครสมาชิกปิดปรับปรุงเนื่องจาก server มีปัญหา โปรดลองใหม่ภายหลัง",
                                                null),
                                          );
                                        }
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (_) => AlertMessage(
                                              "แจ้งเตือน",
                                              "การสมัครสมาชิกปิดปรับปรุงเนื่องจาก server มีปัญหา โปรดลองใหม่ภายหลัง",
                                              null),
                                        );
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    } catch (e) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertMessage("แจ้งเตือน",
                            "กรุณาเลือกประเภทงานที่รับสมัคร", null),
                      );
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: size.width * 0.5,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: new LinearGradient(colors: [
                          Color(0xFF25888E),
                          Color(0xFF31B4BC),
                        ])),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "ลงทะเบียน",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: GestureDetector(
                  onTap: () => {Navigator.pop(context)},
                  child: Text(
                    "มีบัญชีอยู่แล้ว / เข้าสู่ระบบ",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: PrimaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
