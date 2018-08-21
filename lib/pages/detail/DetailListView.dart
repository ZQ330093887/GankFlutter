import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GankFlutter/common/Constant.dart';
import 'package:GankFlutter/model/DailyResponse.dart';

Widget buildCategoryListView(BuildContext context, AsyncSnapshot snapshot) {
  CategoryResponse categoryResponse =
      CategoryResponse.fromJson(jsonDecode(snapshot.data));
  List results = categoryResponse.results;

  if (categoryResponse.error) {
    return buildExceptionIndicator("网络请求错误");
  } else {
    if (categoryResponse.results.length == 0) {
      return buildExceptionIndicator("这里空空的什么都没有呢...");
    } else {
      return buildListViewBuilder(context, results, null);
    }
  }
}

Widget buildListViewBuilder(
    context, List results, ScrollController _controller) {
  print(results);
  switch (results.length) {
    case 1:
      return new Center(
        child: new Card(
          elevation: 16.0,
          child: new Text("暂无数据"),
        ),
      );
    default:
      return new ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(2.0),
        controller: _controller,
        itemCount: results == null ? 0 : results.length,
        itemBuilder: (context, i) {
          return buildRow(context, results[i], false);
        },
      );
  }
}
