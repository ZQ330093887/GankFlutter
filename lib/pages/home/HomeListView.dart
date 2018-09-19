import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GankFlutter/common/Constant.dart';
import 'package:GankFlutter/model/DailyResponse.dart';

Widget buildDailyListView(
    BuildContext context, AsyncSnapshot snapshot, var bannerData) {
  Map<String, dynamic> value;
  List content = new List();
  List title = new List();
  value = jsonDecode(snapshot.data);
  DailyResponse response = DailyResponse.fromJson(value);

  if (response.error) {
    return buildExceptionIndicator("网络请求错误");
  } else {
    if (response.category.length == 0) {
      return buildExceptionIndicator("这里空空的什么都没有呢...");
    } else {
      //这里多做一层循环，主要是为了将福利展示在最前面
      response.category.forEach((row) {
        if (row == '福利') {
          title.insert(0, row);
        } else {
          title.add(row);
        }
      });

      title.forEach((title) {
        content.addAll(response.results[title]);
      });
      return buildListViewBuilder(context, content, bannerData);
    }
  }
}

Widget buildListViewBuilder(context, List content, var bannerList) {
  return new ListView.builder(
    physics: const AlwaysScrollableScrollPhysics(),
    padding: const EdgeInsets.all(2.0),
    itemCount: content == null ? 0 : content.length,
    itemBuilder: (context, i) {
      return buildRow(context, content[i], true, bannerList);
    },
  );
}
