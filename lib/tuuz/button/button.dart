import 'package:flutter/material.dart';
import 'package:bihp_flutter/tuuz/win/close.dart';

class Tuuz_Button {
  @override
  Closebutton() {
    return CloseButton();
  }

  BackButton() {
    return BackButton();
  }

  BackWithWord(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(right: 40),
      child: Text(
        "⇦ 返回",
        style: TextStyle(color: Colors.white, fontSize: 19),
        textAlign: TextAlign.start,
      ),
      onPressed: () {
        Windows().Close(context);
      },
    );
  }

  CloseWithWord(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(right: 40),
      child: Text(
        "×关闭",
        style: TextStyle(color: Colors.white, fontSize: 19),
      ),
      onPressed: () {
        Windows().Close(context);
      },
    );
  }
}
