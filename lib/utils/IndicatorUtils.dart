import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
/*
 * Author: Jpeng
 * Email: peng8350@gmail.com
 * Time: 2018/5/30 上午10:25
 */

class IndicatorFactory {
  Widget buildDefaultHeader(BuildContext context, int mode) {
    return new ClassicIndicator(
      failedText: '刷新失败!',
      completeText: '刷新完成!',
      releaseText: '释放可以刷新',
      idleText: '下拉刷新哦!',
      failedIcon: new Icon(Icons.clear, color: Colors.blue),
      completeIcon: new Icon(Icons.forward_30, color: Colors.blue),
      idleIcon: new Icon(Icons.arrow_downward, color: Colors.blue),
      releaseIcon: new Icon(Icons.arrow_upward, color: Colors.blue),
      refreshingText: '正在刷新...',
      textStyle: new TextStyle(inherit: true, color: Colors.blue),
      mode: mode,
      refreshingIcon: const CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation(Colors.blue),
      ),
    );
  }

  Widget buildDefaultFooter(BuildContext context, int mode,
      [Function requestLoad]) {
    if (mode == RefreshStatus.failed || mode == RefreshStatus.idle) {
      return new InkWell(
        child: new ClassicIndicator(
          mode: mode,
          idleIcon: new Icon(Icons.arrow_upward, color: Colors.blue),
          textStyle: new TextStyle(inherit: true, color: Colors.blue),
          releaseIcon: new Icon(Icons.arrow_upward, color: Colors.blue),
          refreshingText: '火热加载中...',
          idleText: '上拉加载',
          failedText: '网络异常',
          releaseText: '释放可以加载',
          noDataText: '没有更多数据',
          refreshingIcon: const CircularProgressIndicator(
            strokeWidth: 3.0,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
        ),
        onTap: requestLoad,
      );
    } else
      return new ClassicIndicator(
          mode: mode,
          idleIcon: new Icon(Icons.arrow_upward, color: Colors.blue),
          textStyle: new TextStyle(inherit: true, color: Colors.blue),
          releaseIcon: new Icon(Icons.arrow_upward, color: Colors.blue),
          refreshingText: '火热加载中...',
          idleText: '上拉加载',
          failedText: '网络异常',
          releaseText: '释放可以加载',
          refreshingIcon: const CircularProgressIndicator(
            strokeWidth: 3.0,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
          noDataText: '没有更多数据');
  }
}
