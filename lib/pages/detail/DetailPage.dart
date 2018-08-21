import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GankFlutter/api/Api.dart';
import 'package:GankFlutter/api/http.dart';
import 'package:GankFlutter/model/DailyResponse.dart';
import 'package:GankFlutter/common/Constant.dart';
import 'DetailListView.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  String feedType;
  bool showTitle = false;

  DetailPage({Key key, this.feedType, this.showTitle}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var listData;
  var curPage = 1;
  var listTotalSize = 0;
  var requestError = false;
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    super.initState();
    getNewsList(false);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.showTitle) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.feedType),
        ),
        body: DetailBuild(context),
      );
    } else {
      return new Scaffold(
        body: DetailBuild(context),
      );
    }
  }

  Widget DetailBuild(BuildContext context) {
//    print("==>$requestError");
    return requestError
        ? buildExceptionIndicator("网络请求出错了！")
        : listData == null
            ? new Center(
                child: new CupertinoActivityIndicator(),
              )
            : new RefreshIndicator(
                child: buildListViewBuilder(context, listData, _controller),
                onRefresh: _pullToRefresh);
  }

  //网络请求
  getNewsList(bool isLoadMore) {
    var url = Api.FEED_URL;
    url += widget.feedType + '/10/' + this.curPage.toString();
    print("feedListUrl: $url");
    HttpExt.get(url, (data) {
      requestError = false;
      if (data != null) {
        CategoryResponse categoryResponse =
            CategoryResponse.fromJson(jsonDecode(data));
        if (!categoryResponse.error) {
          var _listData = categoryResponse.results;
          print(_listData);
          if (_listData.length > 0) {
            setState(() {
              if (!isLoadMore) {
                listData = _listData;
              } else {
                List list1 = new List();
                list1.addAll(listData);
                list1.addAll(_listData);
                listData = list1;
              }
            });
          }
        }
      }
    }, (e) {
      print("get news list error: $e");
      setState(() {
        requestError = true;
      });
    });
  }

  //刷新
  Future<Null> _pullToRefresh() async {
    curPage = 1;
    getNewsList(false);
    return null;
  }

  //加载更多
  _DetailPageState() {
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      //&& listData.length < listTotalSize
      if (maxScroll == pixels) {
        // scroll to bottom, get next page data
        print("load more ... ");
        curPage++;
        getNewsList(true);
      }
    });
  }
}
