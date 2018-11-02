import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:GankFlutter/common/DetailList.dart';
import 'package:GankFlutter/common/WelfareBuildRows.dart';
import 'package:GankFlutter/model/DailyResponse.dart';
import 'package:GankFlutter/pages/home/HomeBuildRows.dart';
import 'package:GankFlutter/utils/SharedPrfUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//HTTP请求的函数返回值为异步控件Future
Future<String> get(String url) async {
  var httpClient = new HttpClient();
  var request = await httpClient.getUrl(Uri.parse(url));
  var response = await request.close();
  return await response.transform(utf8.decoder).join();
}

/// 通过url判断是否存在缓存，url 是缓存数据的key
Future<String> getCacheData(String url) async {
  ///先通过url获取缓存中的数据
  var cacheData = await SharedPrfUtils.get(url);
  if (cacheData != null) {
    print("----首页走缓存---");
    return json.decode(cacheData);
  } else {
    Future<String> join = get(url);

    join.then<void>((String data) {
      AsyncSnapshot snapshot =
          new AsyncSnapshot<String>.withData(ConnectionState.done, data);
      snapshot.inState(snapshot.data);

      ///缓存网络请求的数据
      SharedPrfUtils.saveString(url, json.encode(snapshot.data));
      print("-------请求网络数据");
    });
    return join;
  }
}

Widget buildRow(context, one, showBanner, bannerData) {
  PostData postData = PostData.fromJson(one);
  if (postData.type == '福利') {
    if (showBanner) {
      return HomeBuildRows(context, bannerData);
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
        child: new Column(
          children: <Widget>[
            new Image.asset(
              'images/empty_data.png',
              width: 50.0,
              height: 50.0,
              color: Colors.grey,
            ),
            new Container(
              padding: EdgeInsets.only(top: 20.0),
              child: new Text(
                message,
                style: const TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    ],
  );
}

///正在加载
Widget buildLoadingIndicator() {
  return new Center(
    child: new CupertinoActivityIndicator(),
  );
}
