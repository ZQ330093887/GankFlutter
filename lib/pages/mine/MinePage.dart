import 'package:flutter/material.dart';
import 'package:GankFlutter/common/GlobalConfig.dart';
import 'myInfoCard.dart';
import 'myServiceCard.dart';
import 'settingCard.dart';
import 'videoCard.dart';
import 'ideaCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:GankFlutter/api/Api.dart';
import 'package:GankFlutter/api/http.dart';
import 'dart:convert';
import 'package:GankFlutter/model/DailyResponse.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new SingleChildScrollView(
      child: new Container(
        color: GlobalConfig.backgroundColor,
        child: new Column(
          children: <Widget>[
            myInfoCard(context),
            myServiceCard(context),
//            settingCard(context),
            videoCard(context), //图片卡片
//            ideaCard(context)
          ],
        ),
      ),
    ));
  }
}
