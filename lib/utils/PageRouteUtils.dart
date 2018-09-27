import 'package:GankFlutter/pages/detail/ArticleDetailPage.dart';
import 'package:GankFlutter/pages/detail/DetailPage.dart';
import 'package:flutter/material.dart';

routePageBuilder(BuildContext context, String title) {
  Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return new DetailPage(
          feedType: title,
          showTitle: true,
        );
      },
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
        return new FadeTransition(
          opacity: animation,
          child: new FadeTransition(
            opacity: new Tween<double>(begin: 0.5, end: 1.0).animate(animation),
            child: child,
          ),
        );
      }));
}

routeWebView(BuildContext context, String title, String url) {
//  Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
//    return new ArticleDetailPage(title: title, url: url);
//  },));

  Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return new ArticleDetailPage(title: title, url: url);
      },
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
        return new FadeTransition(
          opacity: animation,
          child: new FadeTransition(
            opacity: new Tween<double>(begin: 0.5, end: 1.0).animate(animation),
            child: child,
          ),
        );
      }));
}

routePagerNavigator(BuildContext context, Widget v) {
//  Navigator.push(context, new MaterialPageRoute(builder: (context) => v));

  Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return v;
      },
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
        return new FadeTransition(
          opacity: animation,
          child: new FadeTransition(
            opacity: new Tween<double>(begin: 0.5, end: 1.0).animate(animation),
            child: child,
          ),
        );
      }));
}
