import 'package:flutter/material.dart';
import 'package:GankFlutter/common/GlobalConfig.dart';
import 'package:GankFlutter/utils/PageRouteUtils.dart';

Widget myServiceCard(BuildContext context) {
  return new Container(
    color: GlobalConfig.cardBackgroundColor,
    margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
    padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
    child: new Column(
      children: <Widget>[
        new Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      routePageBuilder(context, GlobalConfig.all);
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child:
                                  new Icon(Icons.layers, color: Colors.white),
                              backgroundColor: Colors.green,
                            ),
                          ),
                          new Container(
                            child: new Text(
                              GlobalConfig.all,
                              style: new TextStyle(
                                  color: GlobalConfig.fontColor,
                                  fontSize: 14.0),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      routePageBuilder(context, GlobalConfig.iOS);
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.watch, color: Colors.white),
                              backgroundColor: Colors.blue,
                            ),
                          ),
                          new Container(
                            child: new Text(GlobalConfig.iOS,
                                style: new TextStyle(
                                    color: GlobalConfig.fontColor,
                                    fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      routePageBuilder(context, GlobalConfig.android);
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.tablet_android,
                                  color: Colors.white),
                              backgroundColor: new Color(0xFFA68F52),
                            ),
                          ),
                          new Container(
                            child: new Text(GlobalConfig.android,
                                style: new TextStyle(
                                    color: GlobalConfig.fontColor,
                                    fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
        new Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      routePageBuilder(context, GlobalConfig.h5);
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.tv, color: Colors.white),
                              backgroundColor: new Color(0xFF088DB4),
                            ),
                          ),
                          new Container(
                            child: new Text(
                              GlobalConfig.h5,
                              style: new TextStyle(
                                  color: GlobalConfig.fontColor,
                                  fontSize: 14.0),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      routePageBuilder(context, GlobalConfig.push);
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.radio, color: Colors.white),
                              backgroundColor: Colors.cyan,
                            ),
                          ),
                          new Container(
                            child: new Text(GlobalConfig.push,
                                style: new TextStyle(
                                    color: GlobalConfig.fontColor,
                                    fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      routePageBuilder(context, GlobalConfig.resource);
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.wifi_tethering,
                                  color: Colors.white),
                              backgroundColor: Colors.brown,
                            ),
                          ),
                          new Container(
                            child: new Text(GlobalConfig.resource,
                                style: new TextStyle(
                                    color: GlobalConfig.fontColor,
                                    fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
        new Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      routePageBuilder(context, GlobalConfig.app);
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.text_format,
                                  color: Colors.white),
                              backgroundColor: new Color(0xFF355A9B),
                            ),
                          ),
                          new Container(
                            child: new Text(GlobalConfig.app,
                                style: new TextStyle(
                                    color: GlobalConfig.fontColor,
                                    fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      routePageBuilder(context, GlobalConfig.video);
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.local_movies,
                                  color: Colors.white),
                              backgroundColor: Colors.orange,
                            ),
                          ),
                          new Container(
                            child: new Text(GlobalConfig.video,
                                style: new TextStyle(
                                    color: GlobalConfig.fontColor,
                                    fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      routePageBuilder(context, GlobalConfig.welfare);
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child:
                                  new Icon(Icons.favorite, color: Colors.white),
                              backgroundColor: Colors.red,
                            ),
                          ),
                          new Container(
                            child: new Text(GlobalConfig.welfare,
                                style: new TextStyle(
                                    color: GlobalConfig.fontColor,
                                    fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
