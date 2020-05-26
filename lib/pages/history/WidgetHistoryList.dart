import 'package:GankFlutter/model/CategoryResponse.dart';
import 'package:GankFlutter/utils/TimeUtils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:GankFlutter/common/WebViewPage.dart';
import 'package:GankFlutter/utils/PageRouteUtils.dart';
import 'package:GankFlutter/welfare/PhotoView.dart';

class WidgetHistoryList extends StatefulWidget {
  final PostData gankItem;

  WidgetHistoryList(this.gankItem);

  @override
  _WidgetHistoryState createState() => _WidgetHistoryState();
}

class _WidgetHistoryState extends State<WidgetHistoryList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routePagerNavigator(context, WebViewPage(widget.gankItem.toJson()));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            border: Border(
              bottom:
                  BorderSide(width: 0.0, color: Theme.of(context).dividerColor),
            )),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _buildGankListItem(context),
          ),
        ),
      ),
    );
  }

  ///build gank list item.
  List<Widget> _buildGankListItem(BuildContext context) {
    var contentWidgets = <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 10),
              child: Text(
                widget.gankItem.desc,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.body1,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 8, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.person_outline,
                        color: Theme.of(context).primaryColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: SizedBox(
                            width: 75,
                            child: Text(
                              widget.gankItem.author,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.body2,
                              overflow: TextOverflow.ellipsis,
                            )),
                      )
                    ],
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.access_time,
                            color: Theme.of(context).primaryColor),
                        Padding(
                          padding: const EdgeInsets.only(left: 1.0),
                          child: Text(
                            formatDateStr(widget.gankItem.publishedAt),
                            style: Theme.of(context).textTheme.body2,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];

    ///添加右侧缩略图显示
    if (widget.gankItem.images != null && widget.gankItem.images.isNotEmpty) {
      var imageUrl = widget.gankItem.images[0];
      contentWidgets.add(GestureDetector(
        onTap: () {
          routePagerNavigator(context,
              new PhotoView(item: new BannerData(null, "缩略图", imageUrl)));
        },
        child: Container(
          margin: EdgeInsets.only(right: 16, top: 20, bottom: 20),
          width: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                    imageUrl.replaceAll("large", "thumbnail"))),
          ),
        ),
      ));
    }
    return contentWidgets;
  }
}
