import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:GankFlutter/common/GlobalConfig.dart';

class IndicatorFactory {
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  GlobalKey<EasyRefreshState> get easyRefreshKey =>
      _easyRefreshKey; //  Widget buildDefaultHeader(BuildContext context, int mode) {

  Widget buildDefaultHeader() {
    return ClassicsHeader(
        key: _headerKey,
        refreshText: "pullToRefresh",
        textColor: GlobalConfig.colorPrimary,
        refreshReadyText: "释放可以刷新",
        refreshingText: "正在刷新...",
        refreshedText: "刷新完成",
        moreInfo: "更新于 %T",
        bgColor: Colors.white);
  }

  Widget buildDefaultFooter() {
    return ClassicsFooter(
        key: _footerKey,
        loadHeight: 50.0,
        textColor: GlobalConfig.colorPrimary,
        loadText: "上拉加载",
        loadReadyText: "释放加载",
        loadingText: "火热加载中...",
        loadedText: "加载结束",
        noMoreText: "加载完成",
        moreInfo: "更新于 %T",
        bgColor: Colors.white);
  }
}
