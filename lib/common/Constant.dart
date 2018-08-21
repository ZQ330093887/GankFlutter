import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GankFlutter/common/DetailList.dart';
import 'package:GankFlutter/common/WelfareBuildRows.dart';
import 'package:GankFlutter/model/DailyResponse.dart';
import 'package:GankFlutter/pages/home/HomeBuildRows.dart';

//HTTP请求的函数返回值为异步控件Future
Future<String> get(String category) async {
  var httpClient = new HttpClient();
  var request = await httpClient.getUrl(Uri.parse(category));
  var response = await request.close();
  return await response.transform(utf8.decoder).join();
}

Widget buildRow(context, one, showBanner) {
  PostData postData = PostData.fromJson(one);
  if (postData.type == '福利') {
    if (showBanner) {
      return HomeBuildRows(context, postData);
    } else {
      return BuildWelfareRows(context, postData);
    }
  } else {
    return buildDetailListRow(context, postData);
  }
}

///异常处理
Widget buildExceptionIndicator(String message) {
  return new Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      new Align(
        alignment: Alignment.center,
        child: new Image.asset('images/empty_data.png'),
      ),
      new Align(
        alignment: Alignment.center,
        child: new Text(
          message,
          style: const TextStyle(color: Colors.grey),
        ),
      )
    ],
  );
}

///正在加载
Widget buildLoadingIndicator() {
  return new Center(
    child: new CupertinoActivityIndicator(),
  );
}



