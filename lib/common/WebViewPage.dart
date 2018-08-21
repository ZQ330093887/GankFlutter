import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

/// 网页展示界面
class WebViewPage extends StatefulWidget {
  final Map<String, dynamic> post;

  WebViewPage(this.post);

  @override
  State<StatefulWidget> createState() => new _WebViewState();
}

class _WebViewState extends State<WebViewPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  bool isLoaded = false;

  // Instance of WebView plugin
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  StreamSubscription<WebViewStateChanged> _onStateChanged;

  void showSnack(String msg) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(msg)));
  }

  bool loading = false;

  @override
  initState() {
    super.initState();

    flutterWebviewPlugin.close();

    _onStateChanged =
        flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      print("state: ${state.type}");
      if (state.type == WebViewState.finishLoad) {
        // 加载完成
        setState(() {
          isLoaded = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.

    _onStateChanged.cancel();
    flutterWebviewPlugin.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.post['url']);
    String title =
        widget.post['desc'] == null ? '一个陌生的地方' : widget.post['desc'];

    List<Widget> titleContent = [];
    if (!isLoaded) {
      titleContent.add(new CupertinoActivityIndicator());
    }
    titleContent.add(new Expanded(
        child: new Text(title,
            overflow: TextOverflow.ellipsis,
            style: new TextStyle(fontSize: 16.0))));

    return new WebviewScaffold(
      key: _scaffoldKey,
      url: widget.post['url'],
      withZoom: true,
      withLocalStorage: true,
      withJavascript: true,
      appBar: new AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: titleContent,
        ),
        //title: new Text(title),
        actions: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new IconButton(
              icon: new Icon(Icons.refresh),
              onPressed: () {},
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new IconButton(
              icon: new Icon(Icons.share),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
