import 'package:tuuzflutter2/tuuz/storage/storage.dart';
import 'package:flutter/material.dart';

class AuthAction {
  LoginObject() async {
    Map<String, String?> post = {};
    post["uid"] = await Storage().Get("__uid__");
    post["token"] = await Storage().Get("__token__");
    return post;
  }
}
