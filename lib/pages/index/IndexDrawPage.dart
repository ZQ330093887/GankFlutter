import 'package:flutter/material.dart';
import 'package:GankFlutter/common/GlobalConfig.dart';
import 'package:GankFlutter/utils/PageRouteUtils.dart';
import 'SearchPage.dart';

///侧滑栏
// ignore: must_be_immutable
class IndexDrawPage extends StatelessWidget {
  String email, name, profileimg, background;

  IndexDrawPage({this.background, this.profileimg, this.name, this.email});

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new UserAccountsDrawerHeader(
          accountName: new Text(name),
          accountEmail: new Text(email),
          currentAccountPicture:
              new CircleAvatar(backgroundImage: new AssetImage(background)),
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage(background), fit: BoxFit.cover)),
        ),
        new ListTile(
          title: new Text("福利"),
          trailing: new Icon(
            Icons.whatshot,
            color: Colors.red,
          ),
          onTap: () {
            print("Home");
            Navigator.of(context).pop();
            routePageBuilder(context, GlobalConfig.welfare);
          },
        ),
        new ListTile(
          title: new Text("搜索"),
          trailing: new Icon(
            Icons.search,
            color: Colors.red,
          ),
          onTap: () {
            print("Notification");
            Navigator.of(context).pop();
            routePagerNavigator(context, new SearchPage());
          },
        ),
        new ListTile(
          title: new Text("Exit"),
          trailing: new Icon(Icons.exit_to_app),
          onTap: () {
            print("Exit");
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
