import 'package:flutter/material.dart';
import 'package:GankFlutter/pages/Application.dart';
import 'package:GankFlutter/common/GlobalConfig.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter 干货集中营',
      theme: new ThemeData(
        primarySwatch: GlobalConfig.colorPrimary,
      ),
      home: new ApplicationPage(),
    );
  }
}
