import 'package:GankFlutter/common/GlobalConfig.dart';
import 'package:GankFlutter/model/DailyResponse.dart';
import 'package:GankFlutter/utils/PageRouteUtils.dart';
import 'package:flutter/material.dart';

Widget videoCard(BuildContext context, var results) {
  return new Container(
      color: GlobalConfig.cardBackgroundColor,
      margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
      child: new Column(
        children: <Widget>[
          new Container(
              margin: const EdgeInsets.only(left: 16.0, bottom: 20.0),
              child: new Row(
                children: <Widget>[
                  new Container(
                    child: new CircleAvatar(
                      radius: 20.0,
                      child: new Icon(Icons.child_care, color: Colors.white),
                      backgroundColor: new Color(0xFFB36905),
                    ),
                  ),
                  new Expanded(
                    child: new Container(
                      margin: const EdgeInsets.only(left: 8.0),
                      child: new Text(
                        "妹子福利",
                        style: new TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                  new Container(
                    child: new FlatButton(
                        onPressed: () {
                          routePageBuilder(context, GlobalConfig.welfare);
                        },
                        child: new Text(
                          "更多",
                          style: new TextStyle(color: Colors.blue),
                        )),
                  )
                ],
              )),
          new Container(
            margin: const EdgeInsets.only(left: 16.0),
            child: new SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: new Row(
                children: <Widget>[
                  new Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      margin: const EdgeInsets.only(right: 6.0),
                      child: new AspectRatio(
                          aspectRatio: 4.0 / 2.0,
                          child: new Container(
                            foregroundDecoration: new BoxDecoration(
                                image: new DecorationImage(
                                  image: new NetworkImage(results != null
                                      ? PostData.fromJson(results[0]).url
                                      : "https://pic2.zhimg.com/50/v2-5942a51e6b834f10074f8d50be5bbd4d_400x224.jpg"),
                                  centerSlice: new Rect.fromLTRB(
                                      270.0, 180.0, 1360.0, 1730.0),
                                ),
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(6.0))),
                          ))),
                  new Container(
                      margin: const EdgeInsets.only(right: 6.0),
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: new AspectRatio(
                          aspectRatio: 4.0 / 2.0,
                          child: new Container(
                            foregroundDecoration: new BoxDecoration(
                                image: new DecorationImage(
                                  image: new NetworkImage(results != null
                                      ? PostData.fromJson(results[1]).url
                                      : "https://pic3.zhimg.com/50/v2-7fc9a1572c6fc72a3dea0b73a9be36e7_400x224.jpg"),
                                  centerSlice: new Rect.fromLTRB(
                                      270.0, 180.0, 1360.0, 1730.0),
                                ),
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(6.0))),
                          ))),
                  new Container(
                      margin: const EdgeInsets.only(right: 6.0),
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: new AspectRatio(
                          aspectRatio: 4.0 / 2.0,
                          child: new Container(
                            foregroundDecoration: new BoxDecoration(
                                image: new DecorationImage(
                                  image: new NetworkImage(results != null
                                      ? PostData.fromJson(results[2]).url
                                      : "https://pic4.zhimg.com/50/v2-898f43a488b606061c877ac2a471e221_400x224.jpg"),
                                  centerSlice: new Rect.fromLTRB(
                                      270.0, 180.0, 1360.0, 1730.0),
                                ),
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(6.0))),
                          ))),
                  new Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: new AspectRatio(
                          aspectRatio: 4.0 / 2.0,
                          child: new Container(
                            foregroundDecoration: new BoxDecoration(
                                image: new DecorationImage(
                                  image: new NetworkImage(results != null
                                      ? PostData.fromJson(results[3]).url
                                      : "https://pic1.zhimg.com/50/v2-0008057d1ad2bd813aea4fc247959e63_400x224.jpg"),
                                  centerSlice: new Rect.fromLTRB(
                                      270.0, 180.0, 1360.0, 1730.0),
                                ),
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(6.0))),
                          )))
                ],
              ),
            ),
          )
        ],
      ));
}
