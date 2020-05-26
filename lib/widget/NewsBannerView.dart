import 'package:GankFlutter/common/GlobalConfig.dart';
import 'package:GankFlutter/model/CategoryResponse.dart';
import 'package:GankFlutter/utils/PageRouteUtils.dart';
import 'package:GankFlutter/utils/ScreenUtils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NewsBannerView extends StatelessWidget {
  final List<BannerData> banners;

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
                  routeWebView(context, banner.title, banner.url);
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
                                image: CachedNetworkImageProvider(banner.image),
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
                                banner.title,
                                style: TextStyle(
                                  color: GlobalConfig.cardBackgroundColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(banner.title,
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
