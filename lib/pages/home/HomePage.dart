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

class HomePage extends StatefulWidget {
  String dataDay;

  HomePage({Key key, this.dataDay}) : super(key: key);

  _NewsListState createState() => new _NewsListState();
}

class _NewsListState extends State<HomePage> with HttpExt {
//  var listData;
  String snapshot;
  var url = Api.FEED_URL + '福利/5/1';

  ///该方法暂时放弃
  Future<Null> loadData() async {
    await get(Api.TODAY_URL); //注意await关键字
    if (!mounted) return; //异步处理，防止报错
    setState(() {}); //什么都不做，只为触发RefreshIndicator的子控件刷新
  }

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

  void loadingData() {
    ///请求首页item数据
    getHomeItemData();
  }

  ///请求首页item数据
  void getHomeItemData() {
    getCacheData(Api.TODAY_URL).then<void>((String data) {
      setState(() {
        snapshot = data;
      });
    });
  }
}
