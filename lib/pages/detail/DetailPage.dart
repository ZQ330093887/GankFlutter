import 'dart:async';

import 'package:GankFlutter/api/Api.dart';
import 'package:GankFlutter/api/http.dart';
import 'package:GankFlutter/common/Constant.dart';
import 'package:GankFlutter/model/DailyResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:GankFlutter/utils/IndicatorUtils.dart';

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
  var listData;
  var curPage = 1;
  var listTotalSize = 0;
  var requestError = false;
  RefreshController _refreshController;

  void enterRefresh() {
    _refreshController.requestRefresh(true);
  }

  @override
  void initState() {
    super.initState();
    _refreshController = new RefreshController();
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
    return requestError
        ? buildExceptionIndicator("网络请求出错了！")
        : listData == null
            ? new Center(
                child: new CupertinoActivityIndicator(),
              )
            : new SmartRefresher(
                enablePullUp: true,
                enablePullDown: true,
                controller: _refreshController,
                headerBuilder: buildDefaultHeader,
                footerBuilder: buildDefaultFooter,
                footerConfig: new RefreshConfig(),
                onRefresh: (up) {
                  if (up) {
                    _pullToRefresh();
                  } else {
                    _loadingMore();
                  }
                },
                child: buildListViewBuilder(context, listData, null));
  }

  //网络请求
  getNewsList(bool isLoadMore) {
    var url = Api.FEED_URL;
    url += widget.feedType + '/10/' + this.curPage.toString();
    print("feedListUrl: $url");

    getGankfromNet(url).then((CategoryResponse categoryResponse) {
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

      if (isLoadMore) {
        _refreshController.sendBack(false, RefreshStatus.idle);
      } else {
        _refreshController.sendBack(true, RefreshStatus.completed);
      }
      return false;
    }).catchError((error) {
      _refreshController.sendBack(true, RefreshStatus.failed);
      return false;
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
}
