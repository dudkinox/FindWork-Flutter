import 'package:flutter/material.dart';
import 'package:login_ui/Service/EmailService.dart';

import 'EmailMessage.dart';

void SendEmailForGot(BuildContext context, String mail) async {
  var status = await SendEmailForGotPassword(mail);
  switch (status) {
    case "ส่งรหัส verify แล้ว":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => EmailMessage()));
      break;
  }
}
