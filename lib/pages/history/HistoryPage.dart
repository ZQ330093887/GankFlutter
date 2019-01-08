import 'dart:convert';

import 'package:GankFlutter/api/Api.dart';
import 'package:GankFlutter/api/http.dart';
import 'package:GankFlutter/common/GlobalConfig.dart';
import 'package:GankFlutter/model/DailyResponse.dart';
import 'package:GankFlutter/model/EventList.dart';
import 'package:GankFlutter/utils/SharedPrfUtils.dart';
import 'package:GankFlutter/widget/CalendarCarousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> with HttpExt {
  EventList _markedDateMap = new EventList();

  /// 标志当前在请求中。
  var _isRequesting = true;

  @override
  void initState() {
    super.initState();
    loadingData();
  }

  @override
  Widget build(BuildContext context) {
    CalendarCarousel _calendarCarousel = CalendarCarousel(
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      markedDatesMap: _markedDateMap,
      height: 430.0,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      markedDateMoreShowTotal:
          true, // null for not showing hidden events indicator
    );

    return new Scaffold(
        appBar: new AppBar(title: new Text('历史车轮')),
        body: _isRequesting
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(GlobalConfig.colorPrimary),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //custom icon
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      child: _calendarCarousel,
                    ),
                  ],
                ),
              ));
  }

  ///请求历史日期
  void loadingData() async {
    ///先从缓存中获取日历数据
    var cacheData = await SharedPrfUtils.get(Api.HISTORY_URL);
    if (cacheData != null) {
      var userMap = json.decode(cacheData);
      CategoryResponse categoryResponse = CategoryResponse.fromJson(userMap);
      print("日历获取缓存数据成功");
      setState(() {
        _isRequesting = false;
        timeDataFormat(categoryResponse.results);
      });
    } else {
      print("日历网络请求数据成功");
      requestHistoryData();
    }
  }

  void requestHistoryData() {
    getGankfromNet(Api.HISTORY_URL).then((CategoryResponse categoryResponse) {
      if (!categoryResponse.error) {
        var _listData = categoryResponse.results;
        print("=================================");
        print(_listData);
        if (_listData.length > 0) {
          setState(() {
            _isRequesting = false;
            timeDataFormat(_listData);
            SharedPrfUtils.saveString(
                Api.HISTORY_URL, json.encode(categoryResponse.toJson()));
          });
        }
      }
    });
  }

  void timeDataFormat(var listData) {
    for (var item in listData) {
      List<String> sp = item.split("-");
      _markedDateMap.add(
          new DateTime(int.parse(sp[0]), int.parse(sp[1]), int.parse(sp[2])),
          new DateTime(int.parse(sp[0]), int.parse(sp[1]), int.parse(sp[2])));
    }
  }
}
