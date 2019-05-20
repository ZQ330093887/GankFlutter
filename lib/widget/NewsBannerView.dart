import 'package:GankFlutter/common/GlobalConfig.dart';
import 'package:GankFlutter/model/DailyResponse.dart';
import 'package:GankFlutter/utils/PageRouteUtils.dart';
import 'package:GankFlutter/utils/ScreenUtils.dart';
import 'package:GankFlutter/welfare/PhotoView.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NewsBannerView extends StatelessWidget {
  final List<PostData> banners;

  NewsBannerView(this.banners);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CarouselSlider(
        items: banners.map((banner) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  routePagerNavigator(context, new PhotoView(item: banner));
                },
                child: Container(
                    width: Screen.width,
                    margin:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: Screen.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    banner.url),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3))),
                        ),
                        Opacity(
                          opacity: 0.5,
                          child: Container(
                            width: Screen.width,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          width: Screen.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                banner.who,
                                style: TextStyle(
                                  color: GlobalConfig.cardBackgroundColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(banner.desc,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: GlobalConfig.cardBackgroundColor,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    )),
              );
            },
          );
        }).toList(),
        aspectRatio: 2,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        enlargeCenterPage: true,
      ),
    );
  }
}
