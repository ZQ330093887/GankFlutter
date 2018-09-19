import 'package:GankFlutter/pages/search/SearchListPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => new _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();
  SearchListPage _searchListPage;

  void changeContent() {
    setState(() {
      _searchListPage = new SearchListPage(new ValueKey(controller.text));
    });
  }

  @override
  void initState() {
    super.initState();
    changeContent();
  }

  @override
  Widget build(BuildContext context) {
    TextField searchField = new TextField(
      autofocus: true,
      textInputAction: TextInputAction.search,
      onSubmitted: (content) {
        changeContent();
      },
      decoration: new InputDecoration(
        border: InputBorder.none,
        hintText: '搜索真的好了，不骗你',
        hintStyle: TextStyle(color: Colors.white24),
      ),
      controller: controller,
      style: TextStyle(color: Colors.white),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: searchField,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: () {
                changeContent();
              }),
          new IconButton(
              icon: new Icon(Icons.close),
              onPressed: () {
                setState(() {
                  controller.clear();
                });
              }),
        ],
      ),
      body: _searchListPage,
    );
  }
}
