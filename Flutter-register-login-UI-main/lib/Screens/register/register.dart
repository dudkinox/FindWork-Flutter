// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:login_ui/Controller/LoginController.dart';
import 'package:login_ui/Screens/login/login.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/alert.dart';
import 'package:login_ui/components/background.dart';
import 'package:login_ui/components/selcetChackbox.dart';
import 'package:login_ui/model/loginModel.dart';

class RegisterScreen extends StatefulWidget {

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

    final TextEditingController username = new TextEditingController();
    final TextEditingController fullname = new TextEditingController();
    final TextEditingController password = new TextEditingController();
    final TextEditingController confirmpassword = new TextEditingController();
    final TextEditingController email = new TextEditingController();
    final TextEditingController tel = new TextEditingController();
    final TextEditingController matching = new TextEditingController();
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;


    return Scaffold(
      body: Background(
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
            SizedBox(height: size.height * 0.01),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.account_circle_outlined),
                    labelText: "ชื่อผู้ใช้"),
                controller: username,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.vpn_key_outlined),
                  labelText: "รหัสผ่าน",
                ),
                controller: password,
                obscureText: true,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key_outlined),
                    labelText: "ยืนยันรหัสผ่าน"),
                obscureText: true,
                controller: confirmpassword,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.email_outlined),
                  labelText: "อีเมล",
                ),
                controller: email,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.call_outlined),
                    labelText: "เบอร์โทรศัพท์"),
                    controller: tel,
              ),
            ),
            // matching
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: FeaturesMultiChips(),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: RaisedButton(
                onPressed: () async{
                print("กด1");
                  // final loginModel status = await RegisterEmployee(email.text, username.text, tel.text, username.text, password.text);
                  final RegisterModel status = await RegisterEmployee("2@gmail.com", "t1", "191", "t1", "123456");
                                
                print(status);
                AlertMessage("แจ้งเตือน","สมัครสำเร็จ");
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
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()))
                },
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
      
      
    );
    
  }
}

