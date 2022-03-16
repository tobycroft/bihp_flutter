import 'package:flutter/cupertino.dart';
import 'package:tuuzflutter2/tuuz/alert/ios.dart';

class Ret {
  bool Check_isok(BuildContext context, Map json) {
    if (json["code"] != 0) {
      Alert().Confirm(context, "错误提示", json["echo"], () {});
      return false;
    } else {
      return true;
    }
  }
}
