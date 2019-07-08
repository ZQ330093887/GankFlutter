import 'package:GankFlutter/common/GlobalConfig.dart';
import 'package:GankFlutter/utils/PageRouteUtils.dart';
import 'package:flutter/material.dart';
import 'package:GankFlutter/pages/push/PushPage.dart';
import 'package:GankFlutter/pages/update/UpdatePage.dart';

Widget videoCard(BuildContext context) {
  return new Card(
    child: new Container(
      color: GlobalConfig.cardBackgroundColor,
      margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: new Column(
        children: <Widget>[
          new ListTile(
              leading: const Icon(Icons.score, color: Colors.red),
              title: const Text('干货推荐'),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.red,
                size: 16,
              ),
              onTap: () {
                routePagerNavigator(context, new PushPage());
              }),
//          new Container(
//            height: 1,
//            margin: const EdgeInsets.only(left: 20),
//            width: MediaQuery.of(context).size.width,
//            decoration: new BoxDecoration(
//                border: new BorderDirectional(
//                    start: new BorderSide(
//                        color: Colors.red,
//                        width: MediaQuery.of(context).size.width - 50))),
//          ),
          new ListTile(
              leading: const Icon(Icons.thumbs_up_down, color: Colors.amber),
              title: const Text('感谢编辑'),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.amber,
                size: 16,
              ),
              onTap: () {
                routeWebView(context, GlobalConfig.thinkTitle,
                    GlobalConfig.thanksEditURl);
              }),
          new ListTile(
              leading: const Icon(Icons.update, color: Colors.deepPurpleAccent),
              title: const Text('版本更新'),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.deepPurpleAccent,
                size: 16,
              ),
              onTap: () {
                routePagerNavigator(context, new UpdatePage());
              }),
          new ListTile(
              leading: const Icon(
                Icons.people,
                color: Colors.teal,
              ),
              title: const Text('关于作者'),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.teal,
                size: 16,
              ),
              onTap: () {
                routeWebView(context, GlobalConfig.aboutTitle,
                    GlobalConfig.aboutAuthorURl);
              })
        ],
      ),
    ),
  );
}
