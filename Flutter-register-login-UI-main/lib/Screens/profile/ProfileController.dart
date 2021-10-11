
import 'package:flutter/cupertino.dart';
import 'package:login_ui/Controller/LoginController.dart';
import 'package:login_ui/model/loginModel.dart';

Future<TextEditingController> datafullname(String token) async {
      AccountModel profile = await FindID(token);
      TextEditingController fullname = new TextEditingController();
      fullname.text = profile.fullname;
      return fullname;
    }

Future<TextEditingController> dataemail(String token) async {
      AccountModel profile = await FindID(token);
      TextEditingController email = new TextEditingController();
      email.text = profile.email;
      return email;
    }

Future<TextEditingController> datatel(String token) async {
      AccountModel profile = await FindID(token);
      TextEditingController tel = new TextEditingController();
      tel.text = profile.tel;
      return tel;
    }