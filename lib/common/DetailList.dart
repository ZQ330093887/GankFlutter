import 'package:GankFlutter/common/GlobalConfig.dart';
import 'package:GankFlutter/common/WebViewPage.dart';
import 'package:GankFlutter/model/DailyResponse.dart';
import 'package:GankFlutter/utils/PageRouteUtils.dart';
import 'package:GankFlutter/utils/TimeUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:GankFlutter/utils/ScreenUtils.dart';

Widget buildDetailListRow(context, PostData postData) {
  return new InkWell(
      onTap: () {
        routePagerNavigator(context, WebViewPage(postData.toJson()));
      },
      child: new Card(
        margin: new EdgeInsets.all(2.0),
        child: new Padding(
          padding: new EdgeInsets.all(8.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //左边
              new Offstage(
                offstage: (postData.images == null || postData.images.isEmpty),
                child: new CachedNetworkImage(
                  imageUrl: (postData.images != null &&
                          postData.images.isNotEmpty)
                      ? postData.images[0]
                      : "https://flutter.io/images/homepage/header-illustration.png",
                  fit: BoxFit.cover,
                  width: 80.0,
                  height: 130.0,
                ),
              ),
              //右边
              new Container(
                height: 130.0,
                margin: EdgeInsets.only(left: 8.0),
                width: (postData.images == null || postData.images.isEmpty)
                    ? Screen.width - 32
                    : Screen.width - 130.0,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Row(children: [
                      new Container(
                        margin: new EdgeInsets.fromLTRB(2.0, 4.0, 2.0, 4.0),
                        child: new Align(
                          alignment: Alignment.centerLeft,
                          child: new Icon(
                            Icons.access_time,
                            size: 12.0,
                            color: GlobalConfig.colorPrimary,
                          ),
                        ),
                      ),
                      new Text(
                        postData.source.toString(),
                        style:
                            new TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                      new Expanded(
                          child: new Align(
                        alignment: Alignment.centerRight,
                        child: new Text(
                          getTimestampString(
                              DateTime.parse(postData.publishedAt)),
                          style:
                              new TextStyle(fontSize: 12.0, color: Colors.grey),
                        ),
                      )),
                    ]),
                    new Container(
                      margin: new EdgeInsets.fromLTRB(2.0, 4.0, 2.0, 14.0),
                      child: new Text(
                        postData.desc,
                        maxLines: 3,
                        style: new TextStyle(
                          fontSize: 16.0,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    new Row(children: [
                      new Material(
                        child: new Container(
                          margin: new EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
                          child: new Text(
                            postData.who.toString(),
                            style: new TextStyle(
                                fontSize: 12.0, color: Color(0xFF00BFA5)),
                          ),
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color(0xFFB2DFDB),
                      ),
                      new Container(
                        margin: EdgeInsets.only(left: 15),
                        child: new Material(
                          child: new Container(
                            margin: new EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
                            child: new Text(
                              formatDateStr(postData.publishedAt.toString()),
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.amber),
                            ),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xFFFFECB3),
                        ),
                      ),
                    ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ));
}
