import 'package:flutter/material.dart';
import 'package:GankFlutter/common/GlobalConfig.dart';

class WidgetHistoryTitle extends StatefulWidget {
  final String category;

  WidgetHistoryTitle(this.category);

  @override
  _WidgetHistoryTitleState createState() => _WidgetHistoryTitleState();
}

class _WidgetHistoryTitleState extends State<WidgetHistoryTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: GlobalConfig.cardBackgroundColor,
        border: Border(
          bottom: BorderSide(width: 0.0, color: Theme.of(context).dividerColor),
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            width: 4,
            height: 20,
            color: Theme.of(context).primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              widget.category,
              style: Theme.of(context).textTheme.title,
            ),
          )
        ],
      ),
    );
  }
}
