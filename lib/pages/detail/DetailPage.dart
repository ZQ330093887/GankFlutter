import 'dart:async';
import 'dart:convert';

import 'package:GankFlutter/api/Api.dart';
import 'package:GankFlutter/api/http.dart';
import 'package:GankFlutter/common/Constant.dart';
import 'package:GankFlutter/model/CategoryResponse.dart';
import 'package:GankFlutter/utils/IndicatorUtils.dart';
import 'package:GankFlutter/utils/SharedPrfUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'DetailListView.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  String feedType;
  bool showTitle = false;

  DetailPage({Key key, this.feedType, this.showTitle}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with HttpExt, IndicatorFactory {
  List listData;
  var curPage = 1;
  var listTotalSize = 0;
  var requestError = false;

  @override
  void initState() {
    super.initState();
    _loadingData();
  }

  @override
  Widget build(BuildContext context) {
    Widget detailBuild(BuildContext context) {
      return requestError
          ? buildExceptionIndicator("网络请求出错了！")
          : listData == null
              ? new Center(
                  child: new CupertinoActivityIndicator(),
                )
              : new EasyRefresh(
                  autoLoad: true,
                  key: easyRefreshKey,
                  refreshHeader: buildDefaultHeader(),
                  refreshFooter: buildDefaultFooter(),
                  onRefresh: () {
                    _pullToRefresh();
                  },
                  loadMore: () {
                    _loadingMore();
                  },
                  child: buildListViewBuilder(context, listData));
    }

    if (widget.showTitle) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.feedType),
        ),
        body: detailBuild(context),
      );
    } else {
      return new Scaffold(
        body: detailBuild(context),
      );
    }
  }

  //网络请求
  getNewsList(bool isLoadMore) async {
    String url = getUrl();
    await getGankfromNet(url).then((CategoryResponse categoryResponse) {
      if (categoryResponse.status == 100) {
        var _listData = categoryResponse.data;
        print(_listData);
        print("====================");
        if (_listData.length > 0) {
          setState(() {
            if (!isLoadMore) {
              listData = _listData;
              //目前只缓存第一页数据
              SharedPrfUtils.saveString(
                  url, json.encode(categoryResponse.toJson()));
            } else {
              List list1 = new List();
              list1.addAll(listData);
              list1.addAll(_listData);
              listData = list1;
            }
          });
        }
      }
    }).catchError((error) {
      setState(() {
        print("====================" + error.toString());
        requestError = true;
      });
    }).whenComplete(() {
      if (requestError) return;
      if (easyRefreshKey.currentState == null) return;
      if (isLoadMore) {
        easyRefreshKey.currentState.callLoadMoreFinish();
      } else {
        easyRefreshKey.currentState.callRefreshFinish();
      }
    });
  }

  //刷新
  Future<Null> _pullToRefresh() async {
    curPage = 1;
    getNewsList(false);
    return null;
  }

  //加载更多
  void _loadingMore() {
    print("load more ... ");
    curPage++;
    getNewsList(true);
  }

  void _loadingData() async {
    //先获取缓存数据
    String url = getUrl();
    var cacheData = await SharedPrfUtils.get(url);
    if (cacheData != null) {
      var userMap = json.decode(cacheData);
      CategoryResponse categoryResponse = CategoryResponse.fromJson(userMap);
      print("获取缓存数据成功");
      setState(() {
        listData = categoryResponse.data;
      });
    }

    if (null == listData) {
      print("开始网络请求");
      getNewsList(false);
    }
  }

  String getUrl() {
    var url = Api.FEED_URL +
        (widget.feedType == "Girl" ? "Girl/type/" : "GanHuo/type/");

    url += widget.feedType + '/page/' + this.curPage.toString() + "/count/10";
    print("feedListUrl: $url");
    return url;
  }
}
