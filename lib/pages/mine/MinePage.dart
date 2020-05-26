import 'package:GankFlutter/common/GlobalConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'myInfoCard.dart';
import 'myServiceCard.dart';
import 'videoCard.dart';

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
