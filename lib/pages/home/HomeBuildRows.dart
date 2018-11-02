import 'package:GankFlutter/model/DailyResponse.dart';
import 'package:GankFlutter/widget/HomeBanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget HomeBuildRows(context, postData) {
  List<PostData> banner = new List();

  if (postData != null) {
    for (var value in postData) {
      banner.add(PostData.fromJson(value));
    }
  }
  return new HomeBanner(banner, 200.0);
}
