import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:login_ui/model/loginModel.dart';

AccountModel Username() {
  AccountModel model = AccountModel();
  FutureBuilder(
      future: FlutterSession().get('token'),
      builder: (context, snapshot) {
        print(snapshot.hasData);
        model.fullname = snapshot.hasData
            ? snapshot.data['id'].toString() + "|" + snapshot.data['data']
            : 'Loading...';
        return Text(snapshot.hasData
            ? snapshot.data['id'].toString() + "|" + snapshot.data['data']
            : 'Loading...');
      });
  return model;
}
