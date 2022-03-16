import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bihp_flutter/tuuz/win/close.dart';

class Alert {
  All(BuildContext context, String title, String content, List<Widget> ButtonBuilder) {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(title),
              content: Text(content),
              actions: ButtonBuilder,
            ));
  }

  Simple(BuildContext context, String title, String content, VoidCallback? onPressed_yes) {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(title),
              content: Text(content),
              actions: <Widget>[
                CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("取消")),
                CupertinoButton(
                    onPressed: () {
                      if (onPressed_yes != null) {
                        onPressed_yes();
                      }
                      Navigator.pop(context);
                    },
                    child: Text("确定")),
              ],
            ));
  }

  Error(BuildContext context, String error_text, VoidCallback? on_press) {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text("错误"),
              content: Text(error_text),
              actions: <Widget>[
                CupertinoButton(
                    onPressed: () {
                      if (on_press == null) {
                        Windows().Close(context);
                      } else {
                        Windows().Close(context);
                        on_press();
                      }
                    },
                    child: Text("确认")),
              ],
            ));
  }

  Confirm(BuildContext context, String title, String content, VoidCallback? on_press) {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(title),
              content: Text(content),
              actions: <Widget>[
                CupertinoButton(
                    onPressed: () {
                      if (on_press == null) {
                        Windows().Close(context);
                      } else {
                        Windows().Close(context);
                        on_press();
                      }
                    },
                    child: Text("确认")),
              ],
            ));
  }

  ButtonBuilder(VoidCallback on_pressed, Text text) {
    return CupertinoButton(onPressed: on_pressed, child: text);
  }
}
