import 'dart:async';
import 'dart:convert';

import 'package:GankFlutter/api/Api.dart';
import 'package:GankFlutter/api/http.dart';
import 'package:GankFlutter/common/Constant.dart';
import 'package:GankFlutter/model/DailyResponse.dart';
import 'package:GankFlutter/pages/detail/DetailListView.dart';
import 'package:GankFlutter/utils/IndicatorUtils.dart';
import 'package:GankFlutter/utils/LoadingDialogUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  static const realName = '/search';

  @override
  _SearchPageState createState() => new _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with HttpExt, IndicatorFactory {
  /// 用来搜索的关键字
  var searchStr = "";

  /// 标志当前在请求中。
  var _isRequesting = false;
  var listData;
  var curPage = 1;
  var listTotalSize = 0;
  var requestError = true;
  final controller = TextEditingController();

  ScrollController _controller = new ScrollController();
  LoadingDialogUtils dialogUtils = new LoadingDialogUtils(text: 'aaa');

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: TextField(
            controller: controller,
            // 把键盘设置为搜索。为什么图标没有改变呢，看里面的说明是这样意思呀？
            textInputAction: TextInputAction.search,
            // 点击键盘上的搜索触发。
            onSubmitted: (content) {
              searchStr = content;
              // 进行搜索
              initVar();
              searchArticle(false);
            },

            decoration: InputDecoration(
              hintText: "搜索真的好了，不骗你",
              hintStyle: TextStyle(color: Colors.white70),
            ),
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            new IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  controller.clear();
                })
          ],
        ),
        body: requestError
            ? _isRequesting
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                          Theme.of(context).primaryColor),
                    ),
                  )
                : buildExceptionIndicator("是不是傻！不输东西搜啥")
            : listData == null
                ? new Center(
                    child: buildExceptionIndicator("抱歉！这会我傻了，啥也没搜到"),
                  )
                : new RefreshIndicator(
                    child: buildListViewBuilder(context, listData, _controller),
                    onRefresh: _pullToRefresh));
  }

  //刷新
  Future<Null> _pullToRefresh() async {
    curPage = 1;
    searchArticle(false);
    return null;
  }

  //加载更多
  _SearchPageState() {
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      //&& listData.length < listTotalSize
      if (maxScroll == pixels) {
        // scroll to bottom, get next page data
        print("load more ... ");
        curPage++;
        searchArticle(true);
      }
    });
  }

  //网络请求
  searchArticle(bool isLoadMore) {
    var url = Api.SEARCH_URL;
    url += 'listview/category/' +
        searchStr +
        '/count/10/page/' +
        this.curPage.toString();
    print("feedListUrl: $url");
    if (!isLoadMore) {
      setState(() {
        _isRequesting = true;
        requestError = true;
      });
    }

    HttpExt.get(url, (data) {
      setState(() {
        _isRequesting = false;
        requestError = false;
      });
      if (data != null) {
        CategoryResponse categoryResponse =
            CategoryResponse.fromJson(jsonDecode(data));
        if (!categoryResponse.error) {
          var _listData = categoryResponse.results;
          print(_listData);
          if (_listData.length > 0) {
            setState(() {
              if (!isLoadMore) {
                listData = _listData;
              } else {
                List list1 = new List();
                list1.addAll(listData);
                list1.addAll(_listData);
                listData = list1;
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text("又新增了10条数据总共${listData.length}条数据")));
              }
            });
          } else {
            setState(() {
              listData = null;
            });
          }
        }
      }
    }, (e) {
      print("get news list error: $e");
      setState(() {
        requestError = true;
      });
    });
  }

  void initVar() {
    curPage = 1;
    requestError = true;
    _isRequesting = true;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
