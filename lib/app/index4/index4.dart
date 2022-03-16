import 'dart:convert';
import 'dart:ui';

import 'package:tuuzflutter2/app/index4/balance_record/balance_record.dart';
import 'package:tuuzflutter2/app/index4/url_index4.dart';
import 'package:tuuzflutter2/config/auth.dart';
import 'package:tuuzflutter2/config/res.dart';
import 'package:tuuzflutter2/extend/authaction/authaction.dart';
import 'package:tuuzflutter2/tuuz/win/close.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuuzflutter2/config/config.dart';
import 'package:tuuzflutter2/tuuz/alert/ios.dart';
import 'package:tuuzflutter2/tuuz/net/net.dart';

class Index4 extends StatefulWidget {
  String _title;

  Index4(this._title);

  @override
  _Index4 createState() => _Index4(this._title);
}

class _Index4 extends State<Index4> {
  String _title;

  _Index4(this._title);

  @override
  void initState() {
    get_user_info();
    get_user_balance();
    super.initState();
  }

  @override
  Future<void> get_user_info() async {
    Map<String, String> post = await AuthAction().LoginObject();
    var ret = await Net().Post(Config().Url, Url_Index4().User_info, null, post, null);
    Map json = jsonDecode(ret);
    if (Auth().Return_login_check(context, json)) {
      if (json["code"] == 0) {
        _user_info = json["data"];
        setState(() {});
      } else {
        Alert().Error(context, json["data"], () {});
      }
    } else {
      setState(() {
        _user_info = {
          "uname": "请先登录",
          "qq": "",
        };
      });
    }
  }

  Future<void> get_user_balance() async {
    Map<String, String> post = await AuthAction().LoginObject();
    var ret = await Net().Post(Config().Url, Url_Index4().User_balance, null, post, null);
    Map json = jsonDecode(ret);
    if (Auth().Return_login_check(context, json)) {
      if (json["code"] == 0) {
        _user_balance = json["data"];
        setState(() {});
        print(_user_info);
      } else {
        Alert().Error(context, json["data"], () {});
      }
    } else {
      setState(() {
        _user_balance = {
          "balance": 0,
        };
      });
    }
  }

  Map _user_info = {
    "uname": "请先登录",
    "qq": "",
  };
  Map _user_balance = {
    "balance": 0,
  };

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._title),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: ListView(
        children: [
          Container(
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color: Colors.blue,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      Res().Index4_head_img,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _user_info["uname"].toString(),
                        style: Config().Text_style_Name,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        _user_info["qq"].toString(),
                        style: Config().Text_style_Name,
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Auth().Check_and_goto_login(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              ],
            ),
          ),
          GridView.count(
              padding: EdgeInsets.all(0),
              physics: new NeverScrollableScrollPhysics(),
              //增加
              shrinkWrap: true,
              //增加
              crossAxisCount: 3,
              children: <Widget>[
                Container(
                  width: 100,
                  color: Colors.deepPurpleAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings,
                        size: 80,
                      ),
                      Text(
                        "编写中",
                        style: Config().Text_Style_default,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.restore_page,
                        size: 80,
                      ),
                      Text(
                        "编写中",
                        style: Config().Text_Style_default,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.restore_page,
                        size: 80,
                      ),
                      Text(
                        "编写中",
                        style: Config().Text_Style_default,
                      )
                    ],
                  ),
                ),
              ]),
          Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.account_balance_wallet,
                  color: Colors.black,
                  size: 48,
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                title: Text("积分"),
                subtitle: Text(_user_balance["balance"].toString()),
                onTap: () {
                  Windows().Open(context, Balance_record("积分记录"));
                },
              ),
            ],
          ),
          Container(
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}
