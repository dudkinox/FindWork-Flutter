import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_ui/Service/LoginService.dart';
import 'package:login_ui/model/loginModel.dart';

Future<AccountModel> dataProfile(String token) async {
  AccountModel profile = await FindID(token);
  return profile;
}

Future<TextEditingController> datafullname(String token) async {
  AccountModel profile = await FindID(token);
  TextEditingController fullname = new TextEditingController();
  fullname.text = profile?.fullname;
  return fullname;
}

Future<TextEditingController> dataemail(String token) async {
  AccountModel profile = await FindID(token);
  TextEditingController email = new TextEditingController();
  email.text = profile?.email;
  return email;
}

Future<TextEditingController> datatel(String token) async {
  AccountModel profile = await FindID(token);
  TextEditingController tel = new TextEditingController();
  tel.text = profile?.tel;
  return tel;
}

Future<File> setImage(File file) async {
  file = File(await ImagePicker()
      .getImage(source: ImageSource.gallery)
      .then((pickedFile) => pickedFile.path));
  return file;
}
