import 'package:GankFlutter/common/DetailList.dart';
import 'package:GankFlutter/common/WelfareBuildRows.dart';
import 'package:GankFlutter/model/CategoryResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildRow(context, one) {
  PostData postData = PostData.fromJson(one);
  if (postData.type == 'Girl') {
    return BuildWelfareRows(context, postData);
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
