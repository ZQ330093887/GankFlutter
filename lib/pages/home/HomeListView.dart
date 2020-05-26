import 'package:GankFlutter/common/Constant.dart';
import 'package:GankFlutter/model/BannerEntity.dart';
import 'package:GankFlutter/pages/home/HomeBuildRows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildDailyListView(
    BuildContext context, List homeData, bool requestError) {
  ///如果首页item的数据为空则显示加载进度条
  if (homeData == null) {
    return buildLoadingIndicator();
  }

  if (requestError) {
    return buildExceptionIndicator("网络请求错误");
  }

  if (homeData.length == 0) {
    return buildExceptionIndicator("这里空空的什么都没有呢...");
  } else {
    return buildListViewBuilder(context, homeData);
  }
}

Widget buildListViewBuilder(context, List items) {
  return new ListView.builder(
    physics: const AlwaysScrollableScrollPhysics(),
    padding: const EdgeInsets.all(2.0),
    itemCount: items == null ? 0 : items.length,
    itemBuilder: (context, i) {
      final item = items[i];
      if (item is BannerEntity) {
        return HomeBuildRows(item.banner);
      } else {
        return buildRow(context, item);
      }
    },
  );
}
