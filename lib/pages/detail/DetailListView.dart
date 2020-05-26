import 'package:GankFlutter/common/Constant.dart';
import 'package:GankFlutter/model/CategoryResponse.dart';
import 'package:GankFlutter/pages/history/WidgetHistoryList.dart';
import 'package:GankFlutter/pages/history/WidgetHistoryTitle.dart';
import 'package:GankFlutter/utils/PageRouteUtils.dart';
import 'package:GankFlutter/welfare/PhotoView.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildListViewBuilder(context, List results) {
  print(results);
  switch (results.length) {
    case 1:
      return new Center(
        child: new Card(
          elevation: 16.0,
          child: new Text("暂无数据"),
        ),
      );
    default:
      return new ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(2.0),
//        controller: _controller,
        itemCount: results == null ? 0 : results.length,
        itemBuilder: (context, i) {
          return buildRow(context, results[i]);
        },
      );
  }
}

Widget buildHistoryListView(BuildContext context, GankPost postData) {
  return new ListView.builder(
    physics: const AlwaysScrollableScrollPhysics(),
    padding: const EdgeInsets.all(2.0),
//        controller: _controller,
    itemCount: postData.gankItems == null ? 0 : postData.gankItems.length + 1,
    itemBuilder: (context, i) {
      if (i == 0) {
        return _buildImageBanner(context, postData);
      } else {
        PostData pd = postData.gankItems[i - 1];
        return pd.isTitle
            ? WidgetHistoryTitle(pd.category)
            : WidgetHistoryList(pd);
      }
    },
  );
}

GestureDetector _buildImageBanner(BuildContext context, GankPost postData) {
  return GestureDetector(
    onTap: () {
      BannerData p = new BannerData(null, "美图", postData.girlImage);
      routePagerNavigator(context, new PhotoView(item: p));
    },
    child: CachedNetworkImage(
      height: 200,
      imageUrl: postData.girlImage,
      fit: BoxFit.cover,
    ),
  );
}
