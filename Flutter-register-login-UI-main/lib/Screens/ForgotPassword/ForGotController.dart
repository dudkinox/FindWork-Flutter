import 'package:flutter/material.dart';
import 'package:login_ui/Service/EmailService.dart';
import 'package:login_ui/Service/LoginService.dart';
import 'package:login_ui/components/alert.dart';
import 'package:login_ui/model/loginModel.dart';

import 'EmailMessage.dart';

void SendEmailForGot(BuildContext context, String mail) async {
  List<AccountModel> Fetch = await DataUser();
  bool check = false;
  String token = "";
  for (AccountModel data in Fetch) {
    if (data.email == mail) {
      check = true;
      token = data.id;
      break;
    }
  }
  if (check == true) {
    var status = await SendEmailForGotPassword(mail);
    switch (status) {
      case "ส่งรหัส verify แล้ว":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EmailMessage(token)));
        break;
    }
  } else {
    return showDialog(
      context: context,
      builder: (_) => AlertMessage("แจ้งเตือน", "ไม่พบบัญชีผู้ใช้ในระบบ", null),
    );
  }
}
