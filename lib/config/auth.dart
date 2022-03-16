import 'package:tuuzflutter2/app/login/login.dart';
import 'package:tuuzflutter2/tuuz/storage/storage.dart';
import 'package:tuuzflutter2/tuuz/win/close.dart';
import 'package:flutter/cupertino.dart';

class Auth {
  Future<bool> Check_login() async {
    bool uid = await Storage().Has("__uid__");
    bool token = await Storage().Has("__token__");
    if (uid && token) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> Check_and_goto_login(BuildContext context) async {
    bool uid = await Storage().Has("__uid__");
    bool token = await Storage().Has("__token__");
    if (uid && token) {
      return true;
    } else {
      Goto_Login(context);
      return false;
    }
  }

  bool Return_login_check_and_Goto(BuildContext context, Map json) {
    if (json["code"] == -1) {
      Windows().Open(context, Login());
      return false;
    } else {
      return true;
    }
  }

  bool Return_login_check(BuildContext context, Map json) {
    if (json["code"] == -1) {
      return false;
    } else {
      return true;
    }
  }

  void Goto_Login(BuildContext context) {
    Windows().Open(context, Login());
  }
}
