import 'dart:async';
import 'dart:convert';

import 'package:GankFlutter/api/Api.dart';
import 'package:GankFlutter/api/http.dart';
import 'package:GankFlutter/model/BannerEntity.dart';
import 'package:GankFlutter/model/CategoryResponse.dart';
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
  List listData;
  var requestError = false;

  Future<Null> _pullToRefresh(var list) async {
    await getGankfromNet(Api.TODAY_URL)
        .then((CategoryResponse categoryResponse) {
      if (categoryResponse.status == 100) {
        List _listData = categoryResponse.data;
        setState(() {
          ///缓存网络请求的数据
          //目前只缓存第一页数据
          SharedPrfUtils.saveString(
              Api.TODAY_URL, json.encode(categoryResponse.toJson()));

          BannerEntity bannerEntity = new BannerEntity();
          bannerEntity.banner = new List();
          bannerEntity.banner.addAll(list);
          _listData.insert(0, bannerEntity);
          listData = _listData;
          //目前只缓存第一页数据
        });
      }
    }).catchError((error) {
      setState(() {
        requestError = true;
        listData = new List();
      });
    }).whenComplete(() {});
  }

  @override
  void initState() {
    super.initState();
    getBannerData();
  }

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
      child: buildDailyListView(context, listData, requestError),
      onRefresh: getBannerData,
    );
  }

  ///请求首页item数据
  void loadingData(var list) async {
    var cacheData = await SharedPrfUtils.get(Api.TODAY_URL);
    if (cacheData != null) {
      var userMap = json.decode(cacheData);
      CategoryResponse categoryResponse = CategoryResponse.fromJson(userMap);
      print("----首页走缓存1---");
      List _listData = categoryResponse.data;
      setState(() {
        BannerEntity bannerEntity = new BannerEntity();
        bannerEntity.banner = new List();
        bannerEntity.banner.addAll(list);
        _listData.insert(0, bannerEntity);
        listData = _listData;
      });
    } else {
      print("开始网络请求");
      _pullToRefresh(list);
    }
  }

  Future<Null> getBannerData() async {
    await getGankfromNet(Api.BANNER).then((CategoryResponse categoryResponse) {
      if (categoryResponse.status == 100) {
        loadingData(categoryResponse.data);
      }
    }).catchError((error) {
      setState(() {
        requestError = true;
      });
    });
  }
}
