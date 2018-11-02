import 'dart:async';

import 'package:GankFlutter/api/Api.dart';
import 'package:GankFlutter/api/http.dart';
import 'package:GankFlutter/common/Constant.dart';
import 'package:GankFlutter/model/DailyResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomeListView.dart';

class HomePage extends StatefulWidget {
  _NewsListState createState() => new _NewsListState();
}

class _NewsListState extends State<HomePage> with HttpExt {
  var listData;

  Future<Null> loadData() async {
    await get(Api.TODAY_URL); //注意await关键字
    if (!mounted) return; //异步处理，防止报错
    setState(() {}); //什么都不做，只为触发RefreshIndicator的子控件刷新
  }

  @override
  void initState() {
    super.initState();
    loadBannerData();
  }

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
      child: new FutureBuilder(
        //用于懒加载的FutureBuilder对象
        future: get(Api.TODAY_URL), //HTTP请求获取数据，将被AsyncSnapshot对象监视
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none: //get未执行时
            case ConnectionState.waiting: //get正在执行时
              return buildLoadingIndicator();
            default:
              if (snapshot.hasError) {
                //get执行完成但出现异常
                return buildExceptionIndicator("网络请求出错了！");
              } else {
                //get正常执行完成
                // 创建列表，列表数据来源于snapshot的返回值，而snapshot就是get(widget.newsType)执行完毕时的快照
                // get(widget.newsType)执行完毕时的快照即函数最后的返回值。
                return buildDailyListView(context, snapshot, listData);
              }
          }
        },
      ),
      onRefresh: loadData,
    );
  }

  void loadBannerData() {
    var url = Api.FEED_URL + '福利/5/1';
    print("feedListUrl: $url");
    getGankfromNet(url).then((CategoryResponse categoryResponse) {
      if (!categoryResponse.error) {
        var _listData = categoryResponse.results;
        print(_listData);
        if (_listData.length > 0) {
          setState(() {
            listData = _listData;
          });
        }
      }
      return false;
    });
  }
}
