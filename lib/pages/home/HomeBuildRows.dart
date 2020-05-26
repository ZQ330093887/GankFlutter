import 'package:GankFlutter/model/CategoryResponse.dart';
import 'package:GankFlutter/widget/NewsBannerView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget HomeBuildRows(postData) {
  List<BannerData> banner = new List();
  if (postData != null) {
    for (var value in postData) {
      banner.add(BannerData.fromJson(value));
    }
  }
  return new NewsBannerView(banner);
}
