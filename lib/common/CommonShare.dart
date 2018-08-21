import 'package:flutter/material.dart';
import 'package:GankFlutter/model/MenuModel.dart';

class CommonShare {
  static buildShareBottomPop(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return new Container(
              height: 120.0,
              color: Colors.white,
              child: new GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                padding: const EdgeInsets.all(4.0),
                children: menus_share.map((Menu m) {
                  return new GestureDetector(
                    onTap: () {},
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                            padding:
                                const EdgeInsets.only(top: 12.0, bottom: 12.0),
                            child: new Image.asset(
                              m.icon,
                              width: 40.0,
                              height: 40.0,
                            )),
                        new Text(m.title),
                      ],
                    ),
                  );
                }).toList(),
              ));
        });
  }
}
