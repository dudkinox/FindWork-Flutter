// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:login_ui/Controller/LoginController.dart';
import 'package:login_ui/Screens/login/login.dart';

import 'package:login_ui/Themes/Themes.dart';
import 'package:login_ui/components/alert.dart';
import 'package:login_ui/components/background.dart';
import 'package:login_ui/components/selcetChackbox.dart';
import 'package:login_ui/main.dart';
import 'package:login_ui/model/loginModel.dart';
import 'package:login_ui/model/registerModel.dart';

// class Register {
//   String username;
//   String password;
//   String confirmpassword;
//   String email;
//   String tel;

//   Register(
//       {this.username,
//       this.password,
//       this.confirmpassword,
//       this.email,
//       this.tel});
// }

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final username = GlobalKey<FormState>();
  final password = GlobalKey<FormState>();
  final confirmpassword = GlobalKey<FormState>();
  final email = GlobalKey<FormState>();
  final tel = GlobalKey<FormState>();
  Register register = Register(
      // username: "บัญชีผู้ใช้",
      // password: "รหัสผ่าน",
      // confirmpassword: "ยืนยันรหัสผ่าน",
      // email: "อีเมล",
      // tel: "เบอร์โทรศัพท์",
      );

  // final TextEditingController usernames = new TextEditingController();
  // final TextEditingController fullnames = new TextEditingController();
  // final TextEditingController passwords = new TextEditingController();
  // final TextEditingController confirmpasswords = new TextEditingController();
  // final TextEditingController emails = new TextEditingController();
  // final TextEditingController tels = new TextEditingController();
  // final TextEditingController matching = new TextEditingController();
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
              child: Form(
                key: username,
                child: TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.account_circle_outlined),
                      labelText: "ชื่อผู้ใช้"),
                  // controller: usernames,
                  onSaved: (String username) {
                    register.username = username;
                  },
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
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
                  // controller: passwords,
                  obscureText: true,
                  onSaved: (String password) {
                    register.password = password;
                  },
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
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
                  // controller: confirmpasswords,
                  onSaved: (String confirmpassword) {
                    register.confirmpassword = confirmpassword;
                  },
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: email,
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.email_outlined),
                    labelText: "อีเมล",
                  ),
                  // controller: emails,
                  onSaved: (String email) {
                    register.email = email;
                  },
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: tel,
                child: TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.call_outlined),
                      labelText: "เบอร์โทรศัพท์"),
                  // controller: tels,
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
              child: FeaturesMultiChips(),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: RaisedButton(
                onPressed: () {
                  username.currentState.save();
                  password.currentState.save();
                  confirmpassword.currentState.save();
                  email.currentState.save();
                  tel.currentState.save();
                  print(
                      "บัญชีผู้ใช้ = ${register.username} รหัสผ่าน = ${register.password} ยืนยันรหัสผ่าน =${register.confirmpassword} อีเมล = ${register.email} เบอร์โทรศัพท์ = ${register.tel}");

                  if (register.password != register.confirmpassword) {
                    showDialog(
                        context: context,
                        builder: (_) => AlertMessage(
                            "แจ้งเตือน", "กรอกรหัสผ่านไม่ตรงกัน", null));
                  } else {
                    username.currentState.reset();
                    password.currentState.reset();
                    confirmpassword.currentState.reset();
                    email.currentState.reset();
                    tel.currentState.reset();
                    // final RegisterModel status = await RegisterEmployee(
                    //     "บัญชีผู้ใช้ = ${register.username}",
                    //     "รหัสผ่าน = ${register.password}",
                    //     "ยืนยันรหัสผ่าน = ${register.confirmpassword}",
                    //     "อีเมล = ${register.email}",
                    //     "เบอร์โทรศัพท์ = ${register.tel}");

                    showDialog(
                      context: context,
                      builder: (_) =>
                          AlertMessage("แจ้งเตือน", "สมัครสำเร็จ", MyApp()),
                    );
                  }
                },

                // onPressed: () async {
                //   // print("กด1");
                //   // final RegisterModel status = await RegisterEmployee(
                //   //     email.text,
                //   //     username.text,
                //   //     tel.text,
                //   //     username.text,
                //   //     password.text);

                //   print("บัญชีผู้ใช้" + username.text);
                //   ("รหัสผ่าน" + password.text);
                //   ("ยืนยันรหัสผ่าน" + confirmpassword.text);
                //   ("อีเมล" + email.text);
                //   ("เบอร์โทรศัพท์" + tel.text);

                //   "2@gmail.com", "t1", "191", "t1", "123456");

                // print(status);
                // AlertMessage("แจ้งเตือน", "สมัครสำเร็จ");
                //  },
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
