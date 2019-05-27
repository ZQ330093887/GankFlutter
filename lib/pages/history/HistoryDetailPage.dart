import 'dart:async';

import 'package:GankFlutter/api/Api.dart';
import 'package:GankFlutter/api/http.dart';
import 'package:GankFlutter/common/Constant.dart';
import 'package:GankFlutter/model/DailyResponse.dart';
import 'package:GankFlutter/pages/detail/DetailListView.dart';
import 'package:GankFlutter/utils/IndicatorUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

// ignore: must_be_immutable
class HistoryDetailPage extends StatefulWidget {
  String data;

  HistoryDetailPage({Key key, this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HistoryDetailState();
}

class _HistoryDetailState extends State<HistoryDetailPage>
    with HttpExt, IndicatorFactory {
  GankPost listData;
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
                  onRefresh: () {
                    _pullToRefresh();
                  },
                  child: buildHistoryListView(context, listData));
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.data.replaceAll("/", "-")),
      ),
      body: detailBuild(context),
    );
  }

  void _loadingData() async {
    String url = getUrl();
    await getGankDayData(url).then((GankPost dailyResponse) {
      print(dailyResponse);
      setState(() {
        requestError = false;
        listData = dailyResponse;
      });
    }).catchError((error) {
      setState(() {
        requestError = true;
      });
    }).whenComplete(() {
      if (requestError) return;
      easyRefreshKey.currentState.callRefreshFinish();
    });
  }

  //刷新
  Future<Null> _pullToRefresh() async {
    _loadingData();
    return null;
  }

  String getUrl() {
    var url = Api.DATA_DAY_URL + widget.data;
    print("Url==>: $url");
    return url;
  }
}
