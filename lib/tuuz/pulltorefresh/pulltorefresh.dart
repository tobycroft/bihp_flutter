import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class PullToRefresh {
  PullRefresh(BuildContext context, List list, Function UI_List, OnRefreshCallback? Void) {
    return EasyRefresh(
      child: ListView.builder(
        itemBuilder: (BuildContext con, int index) => UI_List(context, list[index]),
        itemCount: list.length,
      ),
      firstRefresh: false,
      onRefresh: Void,
    );
  }
}
