import 'package:flutter/material.dart';
import 'package:login_ui/Controller/LoginController.dart';
import 'package:login_ui/Screens/homehome.dart';
import 'package:login_ui/Screens/register/register.dart';
import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/alert.dart';
import 'package:login_ui/components/background.dart';
import 'package:login_ui/main.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void login(String username, String password) async {
      dynamic login = await Login(username, password);

      if (login != "false") {
        switch (login) {
          case "employee":
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeHome(0)));
            break;
          case "employer":
            break;
        }
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertMessage(
              "แจ้งเตือน", "บัญชีผู้ใช้หรือรหัสผ่านไม่ถูกต้อง", MyApp()),
        );
      }
    }

    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "เข้าสู่ระบบ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF31B4BC),
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                    icon: Icon(Icons.account_circle_outlined),
                    labelText: "ชื่อผู้ใช้"),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key_outlined), labelText: "รหัสผ่าน"),
                obscureText: true,
                controller: password,
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text(
                "ลืมรหัสผ่าน?",
                style: TextStyle(fontSize: 12, color: PrimaryColor),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  height: 50.0,
                  width: size.width * 0.5,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      gradient: new LinearGradient(colors: [
                        Color(0xFF25888E),
                        Color(0xFF31B4BC),
                      ])),
                  padding: const EdgeInsets.all(0),
                  child: GestureDetector(
                    onTap: () => {
                      login(username.text, password.text),
                      print("object"),
                    },
                    child: Text(
                      "เข้าสู่ระบบ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        height: 2,
                      ),
                    ),
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
                      MaterialPageRoute(builder: (context) => RegisterScreen()))
                },
                child: Text(
                  "สมัครสมาชิก",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: PrimaryColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
