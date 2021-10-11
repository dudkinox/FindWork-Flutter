import 'package:login_ui/Controller/LoginController.dart';
import 'package:login_ui/model/loginModel.dart';

Future<AccountModel> DataProfile(String token) async {
  AccountModel model = await FindID(token);
  return model;
}
