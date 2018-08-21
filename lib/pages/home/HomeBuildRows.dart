import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GankFlutter/model/DailyResponse.dart';
import 'package:GankFlutter/widget/HomeBanner.dart';

// ignore: non_constant_identifier_names
Widget HomeBuildRows(context, postData) {
  List<PostData> _topDatas = new List<PostData>();
  _topDatas.add(new PostData(
      "",
      "",
      "",
      null,
      "",
      "",
      "",
      "https://ws1.sinaimg.cn/large/0065oQSqly1fubd0blrbuj30ia0qp0yi.jpg",
      null,
      ""));
  _topDatas.add(new PostData(
      "",
      "",
      "",
      null,
      "",
      "",
      "",
      "https://ww1.sinaimg.cn/large/0065oQSqgy1fu39hosiwoj30j60qyq96.jpg",
      null,
      ""));
  _topDatas.add(new PostData(
      "",
      "",
      "",
      null,
      "",
      "",
      "",
      "https://ww1.sinaimg.cn/large/0065oQSqly1ftzsj15hgvj30sg15hkbw.jpg",
      null,
      ""));
  _topDatas.add(new PostData(
      "",
      "",
      "",
      null,
      "",
      "",
      "",
      "https://ww1.sinaimg.cn/large/0065oQSqly1ftu6gl83ewj30k80tites.jpg",
      null,
      ""));
  _topDatas.insert(0, postData);
  return new HomeBanner(_topDatas, 200.0);
}
