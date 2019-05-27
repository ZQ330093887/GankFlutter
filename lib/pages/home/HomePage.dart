import 'dart:async';
import 'dart:convert';

import 'package:GankFlutter/api/Api.dart';
import 'package:GankFlutter/api/http.dart';
import 'package:GankFlutter/common/Constant.dart';
import 'package:GankFlutter/model/DailyResponse.dart';
import 'package:GankFlutter/utils/SharedPrfUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomeListView.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  String dataDay;

  HomePage({Key key, this.dataDay}) : super(key: key);

  _NewsListState createState() => new _NewsListState();
}

class _NewsListState extends State<HomePage> with HttpExt {
  String snapshot;
  Future<Null> _pullToRefresh() async {
    await get(Api.TODAY_URL).then<void>((String data) {
      setState(() {
        snapshot = data;
        print("刷新成功");

        ///缓存网络请求的数据
        SharedPrfUtils.saveString(Api.TODAY_URL, json.encode(data));
      });
    }); //注意await关键字
  }

  @override
  void initState() {
    super.initState();
    loadingData();
  }

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
      child: buildDailyListView(context, snapshot),
      onRefresh: _pullToRefresh,
    );
  }

  ///请求首页item数据
  void loadingData() {
    getCacheData(Api.TODAY_URL).then<void>((String data) {
      setState(() {
        snapshot = data;
      });
    });
  }
}
