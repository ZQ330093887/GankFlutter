import 'package:flutter/material.dart';
import 'package:GankFlutter/common/GlobalConfig.dart';
import 'package:GankFlutter/model/DailyResponse.dart';
import 'package:GankFlutter/utils/PageRouteUtils.dart';

Widget ideaCard(BuildContext context, var results) {
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
                      child: new Icon(Icons.videocam, color: Colors.white),
                      backgroundColor: GlobalConfig.colorPrimary,
                    ),
                  ),
                  new Expanded(
                    child: new Container(
                      margin: const EdgeInsets.only(left: 8.0),
                      child: new Text(
                        "休息视频",
                        style: new TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                  new Container(
                    child: new FlatButton(
                        onPressed: () {
                          routePageBuilder(context, GlobalConfig.video);
                        },
                        child: new Text(
                          "更多",
                          style: new TextStyle(color: GlobalConfig.colorPrimary),
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
                      margin: const EdgeInsets.only(right: 6.0),
                      decoration: new BoxDecoration(
                          color: GlobalConfig.searchBackgroundColor,
                          borderRadius:
                          new BorderRadius.all(new Radius.circular(6.0))),
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: new Column(
                              children: <Widget>[
                                new Align(
                                  alignment: Alignment.centerLeft,
                                  child: new Container(
                                    child: new Text(
                                      results != null
                                          ? PostData
                                          .fromJson(results[0])
                                          .desc
                                          :"苹果 WWDC 2018 正在举行",
                                      style: new TextStyle(
                                          color: Colors.black, fontSize: 12.0),
                                    ),
                                  ),
                                ),
                                new Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Container(
                                      margin: const EdgeInsets.only(top: 6.0),
                                      child: new Text(
                                        "软件更新意料之中，硬件之谜...",
                                        style: new TextStyle(
                                            color: GlobalConfig.fontColor),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          new Container(
                              margin: const EdgeInsets.all(10.0),
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 5,
                              child: new AspectRatio(
                                  aspectRatio: 1.0 / 1.0,
                                  child: new Container(
                                    foregroundDecoration: new BoxDecoration(
                                        image: new DecorationImage(
                                          image: new NetworkImage(
                                              "https://pic2.zhimg.com/50/v2-55039fa535f3fe06365c0fcdaa9e3847_400x224.jpg"),
                                          centerSlice: new Rect.fromLTRB(
                                              270.0, 180.0, 1360.0, 730.0),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(6.0))),
                                  )))
                        ],
                      )),
                  new Container(
                      margin: const EdgeInsets.only(right: 6.0),
                      decoration: new BoxDecoration(
                          color: GlobalConfig.searchBackgroundColor,
                          borderRadius:
                          new BorderRadius.all(new Radius.circular(6.0))),
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: new Column(
                              children: <Widget>[
                                new Align(
                                  alignment: Alignment.centerLeft,
                                  child: new Container(
                                    child: new Text(
                                      results != null
                                          ? PostData
                                          .fromJson(results[1])
                                          .desc
                                          :"此刻你的桌子是什么样子？",
                                      style: new TextStyle(
                                          color: Colors.black, fontSize: 12.0),
                                    ),
                                  ),
                                ),
                                new Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Container(
                                      margin: const EdgeInsets.only(top: 6.0),
                                      child: new Text(
                                        "晒一晒你的书桌/办公桌",
                                        style: new TextStyle(
                                            color: GlobalConfig.fontColor),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          new Container(
                              margin: const EdgeInsets.all(10.0),
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 5,
                              child: new AspectRatio(
                                  aspectRatio: 1.0 / 1.0,
                                  child: new Container(
                                    foregroundDecoration: new BoxDecoration(
                                        image: new DecorationImage(
                                          image: new NetworkImage(
                                              "https://pic3.zhimg.com/v2-b4551f702970ff37709cdd7fd884de5e_294x245|adx4.png"),
                                          centerSlice: new Rect.fromLTRB(
                                              270.0, 180.0, 1360.0, 730.0),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(6.0))),
                                  )))
                        ],
                      )),
                  new Container(
                      margin: const EdgeInsets.only(right: 6.0),
                      decoration: new BoxDecoration(
                          color: GlobalConfig.searchBackgroundColor,
                          borderRadius:
                          new BorderRadius.all(new Radius.circular(6.0))),
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: new Column(
                              children: <Widget>[
                                new Align(
                                  alignment: Alignment.centerLeft,
                                  child: new Container(
                                    child: new Text(
                                      results != null
                                          ? PostData
                                          .fromJson(results[2])
                                          .desc
                                          :"关于高考你印象最深的是...",
                                      style: new TextStyle(
                                          color: Colors.black, fontSize: 12.0),
                                    ),
                                  ),
                                ),
                                new Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Container(
                                      margin: const EdgeInsets.only(top: 6.0),
                                      child: new Text(
                                        "聊聊你的高三生活",
                                        style: new TextStyle(
                                            color: GlobalConfig.fontColor),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          new Container(
                              margin: const EdgeInsets.all(10.0),
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 5,
                              child: new AspectRatio(
                                  aspectRatio: 1.0 / 1.0,
                                  child: new Container(
                                    foregroundDecoration: new BoxDecoration(
                                        image: new DecorationImage(
                                          image: new NetworkImage(
                                              "https://pic2.zhimg.com/50/v2-ce2e01a047e4aba9bfabf8469cfd3e75_400x224.jpg"),
                                          centerSlice: new Rect.fromLTRB(
                                              270.0, 180.0, 1360.0, 730.0),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(6.0))),
                                  )))
                        ],
                      )),
                  new Container(
                      margin: const EdgeInsets.only(right: 6.0),
                      decoration: new BoxDecoration(
                          color: GlobalConfig.searchBackgroundColor,
                          borderRadius:
                          new BorderRadius.all(new Radius.circular(6.0))),
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: new Column(
                              children: <Widget>[
                                new Align(
                                  alignment: Alignment.centerLeft,
                                  child: new Container(
                                    child: new Text(
                                      results != null
                                          ? PostData
                                          .fromJson(results[3])
                                          .desc
                                          :"夏天一定要吃的食物有哪些",
                                      style: new TextStyle(
                                          color: Colors.black, fontSize: 12.0),
                                    ),
                                  ),
                                ),
                                new Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Container(
                                      margin: const EdgeInsets.only(top: 6.0),
                                      child: new Text(
                                        "最适合夏天吃的那种",
                                        style: new TextStyle(
                                            color: GlobalConfig.fontColor),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          new Container(
                              margin: const EdgeInsets.all(10.0),
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 5,
                              child: new AspectRatio(
                                  aspectRatio: 1.0 / 1.0,
                                  child: new Container(
                                    foregroundDecoration: new BoxDecoration(
                                        image: new DecorationImage(
                                          image: new NetworkImage(
                                              "https://pic1.zhimg.com/50/v2-bb3806c2ced60e5b7f38a0aa06b89511_400x224.jpg"),
                                          centerSlice: new Rect.fromLTRB(
                                              270.0, 180.0, 1360.0, 730.0),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(6.0))),
                                  )))
                        ],
                      )),
                ],
              ),
            ),
          )
        ],
      ));
}
