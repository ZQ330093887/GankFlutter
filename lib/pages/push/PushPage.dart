import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GankFlutter/common/GlobalConfig.dart';

class PushPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _PushPageState();
  }
}

class _PushPageState extends State<PushPage> {
  bool _lights = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(GlobalConfig.pushTitle),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Row(children: [
            new Expanded(
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  new Container(
                      padding: EdgeInsets.fromLTRB(22.0, 24.0, 0.0, 0.0),
                      child: new Text(GlobalConfig.pushTitle,
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                          ))),
                  new Container(
                    padding: EdgeInsets.fromLTRB(22.0, 6.0, 0.0, 10.0),
                    child: new Text(GlobalConfig.pushSubTitle,
                        style: new TextStyle(
                            color: Colors.grey[500], fontSize: 12.0)),
                  ),
                ])),
            new Container(
              padding: EdgeInsets.only(right: 22.0),
              child: new CupertinoSwitch(
                value: _lights,
                activeColor: Colors.blue,
                onChanged: (bool value) {
                  setState(() {
                    _lights = value;
//                    print(value);
                  });
                },
              ),
            )
          ]),
          new Container(
              padding: EdgeInsets.fromLTRB(22.0, 40.0, 22.0, 10.0),
              child: new Text(
                GlobalConfig.pushInfo,
                style: new TextStyle(fontSize: 14.0),
              )),
          new Container(
              padding: EdgeInsets.fromLTRB(22.0, 10.0, 22.0, 5.0),
              child: new Text(
                GlobalConfig.pushNext1,
                style: new TextStyle(fontSize: 12.0),
              )),
          new Container(
              padding: EdgeInsets.fromLTRB(22.0, 10.0, 22.0, 5.0),
              child: new Text(
                GlobalConfig.pushNext2,
                style: new TextStyle(fontSize: 12.0),
              )),
          new Container(
              padding: EdgeInsets.fromLTRB(22.0, 10.0, 22.0, 5.0),
              child: new Text(
                GlobalConfig.pushNext3,
                style: new TextStyle(fontSize: 12.0),
              )),
        ],
      ),
    );
  }
}
