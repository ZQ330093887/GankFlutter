import 'package:GankFlutter/pages/detail/DetailPage.dart';
import 'package:flutter/material.dart';

class ClassifyTabPage {
  ClassifyTabPage({this.icon, this.text, this.detailPage});

  final IconData icon;
  final String text;
  final DetailPage detailPage;

  List<ClassifyTabPage> initClassify() {
    // 存储所有页面的列表
    List<ClassifyTabPage> _allPages = <ClassifyTabPage>[
      new ClassifyTabPage(
          text: "all",
          detailPage: new DetailPage(
            feedType: ('All'),
            showTitle: false,
          )),
      new ClassifyTabPage(
          text: "福利",
          detailPage: new DetailPage(
            feedType: ('Girl'),
            showTitle: false,
          )),
      new ClassifyTabPage(
          text: "Android",
          detailPage: new DetailPage(
            feedType: ('Android'),
            showTitle: false,
          )),
      new ClassifyTabPage(
          text: "iOS",
          detailPage: new DetailPage(
            feedType: ('iOS'),
            showTitle: false,
          )),
      new ClassifyTabPage(
          text: "前端",
          detailPage: new DetailPage(
            feedType: ('frontend'),
            showTitle: false,
          )),
      new ClassifyTabPage(
          text: "Flutter",
          detailPage: new DetailPage(
            feedType: ('Flutter'),
            showTitle: false,
          )),
      new ClassifyTabPage(
          text: "App",
          detailPage: new DetailPage(
            feedType: ('app'),
            showTitle: false,
          )),
    ];
    return _allPages;
  }
}
