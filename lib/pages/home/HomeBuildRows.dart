import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GankFlutter/model/DailyResponse.dart';
import 'package:GankFlutter/widget/HomeBanner.dart';

// ignore: non_constant_identifier_names
Widget HomeBuildRows(context, postData) {
  List<PostData> banner = new List();
  postData.forEach((r) {
    banner.add(PostData.fromJson(r));
  });
  return new HomeBanner(banner, 200.0);
}
