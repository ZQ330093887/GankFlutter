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
            feedType: ('all'),
            showTitle: false,
          )),
      new ClassifyTabPage(
          text: "福利",
          detailPage: new DetailPage(
            feedType: ('福利'),
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
            feedType: ('前端'),
            showTitle: false,
          )),
      new ClassifyTabPage(
          text: "拓展资源",
          detailPage: new DetailPage(
            feedType: ('拓展资源'),
            showTitle: false,
          )),
      new ClassifyTabPage(
          text: "瞎推荐",
          detailPage: new DetailPage(
            feedType: ('瞎推荐'),
            showTitle: false,
          )),
      new ClassifyTabPage(
          text: "App",
          detailPage: new DetailPage(
            feedType: ('App'),
            showTitle: false,
          )),
      new ClassifyTabPage(
          text: "休息视频",
          detailPage: new DetailPage(
            feedType: ('休息视频'),
            showTitle: false,
          )),
    ];
    return _allPages;
  }
}
