import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:GankFlutter/model/DailyResponse.dart';

import 'dart:convert';

class HttpExt {
  static void get(String url, Function callback, Function errorCallback) async {
    try {
      http.Response res = await http.get(url);
      if (callback != null) {
        callback(res.body);
      }
    } catch (exception) {
      if (errorCallback != null) {
        errorCallback(exception);
      }
    }
  }

  Future<String> getRequest(String url, [Map params]) async {
    http.Response response = await http.get(url, headers: params);
    return response.body.toString();
  }

  Future<CategoryResponse> getGankfromNet(String url) async {
    final responseStr = await getRequest(url);
    return toGankList(responseStr);
  }

  CategoryResponse toGankList(String responseStr) {
    return CategoryResponse.fromJson(jsonDecode(responseStr));
  }

  Future<GankPost> getGankDayData(String url) async {
    final responseStr = await getRequest(url);
    return toGankDayList(responseStr);
  }

  GankPost toGankDayList(String responseStr) {
    return GankPost.fromJson(jsonDecode(responseStr));
  }

  static void post(String url, Function callback,
      {Map<String, String> params, Function errorCallback}) async {
    try {
      http.Response res = await http.post(url, body: params);
      if (callback != null) {
        callback(res.body);
      }
    } catch (e) {
      if (errorCallback != null) {
        errorCallback(e);
      }
    }
  }
}
