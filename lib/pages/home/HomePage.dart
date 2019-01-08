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
  var listData;
  String snapshot;
  var url = Api.FEED_URL + '福利/5/1';

  ///该方法暂时放弃
  Future<Null> loadData() async {
    await get(Api.TODAY_URL); //注意await关键字
    if (!mounted) return; //异步处理，防止报错
    setState(() {}); //什么都不做，只为触发RefreshIndicator的子控件刷新
  }

  Future<Null> _pullToRefresh() async {
    requestHomeBanner(url);
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
      ///懒加载这种方式对缓存策略不友好，暂时放弃
//      child: new FutureBuilder(
//        //用于懒加载的FutureBuilder对象
//        future: get(Api.TODAY_URL), //HTTP请求获取数据，将被AsyncSnapshot对象监视
//        builder: (BuildContext context, AsyncSnapshot snapshot) {
//          switch (snapshot.connectionState) {
//            case ConnectionState.none: //get未执行时
//            case ConnectionState.waiting: //get正在执行时
//              return buildLoadingIndicator();
//            default:
//              if (snapshot.hasError) {
//                //get执行完成但出现异常
//                return buildExceptionIndicator("网络请求出错了！");
//              } else {
//                //get正常执行完成
//                // 创建列表，列表数据来源于snapshot的返回值，而snapshot就是get(widget.newsType)执行完毕时的快照
//                // get(widget.newsType)执行完毕时的快照即函数最后的返回值。
//                return buildDailyListView(context, snapshot, listData);
//              }
//          }
//        },
//      ),
      child: buildDailyListView(context, snapshot, listData),
      onRefresh: _pullToRefresh,
    );
  }

  void loadingData() {
    ///请求banner数据
    loadBannerData();

    ///请求首页item数据
    getHomeItemData();
  }

  ///请求banner数据
  void loadBannerData() async {
    print("feedListUrl: $url");

    ///先从缓存中获取banner图片数据
    var cacheData = await SharedPrfUtils.get(url);
    if (cacheData != null) {
      var userMap = json.decode(cacheData);
      CategoryResponse categoryResponse = CategoryResponse.fromJson(userMap);
      print("banner获取缓存数据成功");
      setState(() {
        listData = categoryResponse.results;
      });
    } else {
      print("banner网络请求数据成功");
      requestHomeBanner(url);
    }

    requestHomeBanner(url);
  }

  ///通过网络请求banner数据
  void requestHomeBanner(String url) {
    getGankfromNet(url).then((CategoryResponse categoryResponse) {
      if (!categoryResponse.error) {
        var _listData = categoryResponse.results;
        print(_listData);
        if (_listData.length > 0) {
          setState(() {
            listData = _listData;
            //目前只缓存第一页数据
            SharedPrfUtils.saveString(
                url, json.encode(categoryResponse.toJson()));
          });
        }
      }
    });
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
