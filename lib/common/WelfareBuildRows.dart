import 'package:GankFlutter/model/CategoryResponse.dart';
import 'package:GankFlutter/utils/PageRouteUtils.dart';
import 'package:GankFlutter/welfare/PhotoView.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget BuildWelfareRows(context, PostData postData) {
  final ThemeData theme = Theme.of(context);
  final TextStyle titleStyle =
      theme.textTheme.headline5.copyWith(color: Colors.white);

  return new InkWell(
      onTap: () => {
            routePagerNavigator(context,
                new PhotoView(item: new BannerData(null, "美图", postData.url)))
          },
      child: new Card(
        margin: new EdgeInsets.all(2.0),
        child: new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new SizedBox(
              height: 300.0,
              child: new Stack(
                children: <Widget>[
                  Positioned.fill(
//                    child: FadeInImage.assetNetwork(
//                        placeholder: 'images/bg.jpg',
//                        image: postData.url,
//                        fit: BoxFit.cover),
                    child: new CachedNetworkImage(
                      placeholder: (context, url) =>
                          CupertinoActivityIndicator(),
                      imageUrl: postData.url,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    bottom: 6.0,
                    left: 6.0,
                    right: 6.0,
                    child: new FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.bottomLeft,
                      child: new Text(
                        postData.desc,
                        style: titleStyle,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ));
}
