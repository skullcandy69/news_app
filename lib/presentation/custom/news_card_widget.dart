import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/models/screen_arguments.dart';
import 'package:news_app/presentation/custom/bookmark_widget.dart';
import 'package:news_app/presentation/custom/custom_text_widget.dart';
import 'package:news_app/presentation/news_view_page.dart';
import 'package:news_app/utils/styles.dart';

class NewsCard extends StatelessWidget {
  final News news;
  final bool isFav;
  final bool isHome;

  NewsCard(this.news, {this.isFav = false, this.isHome = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => NewsViewPage(
                      arguments: ScreenArguments(news: news),
                      isHome: !isFav && isHome,
                    )));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              ScreenUtil.instance.setWidth(16),
            ),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(
                ScreenUtil.instance.setWidth(8),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    ScreenUtil.instance.setWidth(16),
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Hero(
                        tag: news.urlToImage == null
                            ? news.publishedAt + news.id.toString()
                            : news.urlToImage + news.id.toString(),
                        child: Container(
                          margin: EdgeInsets.only(
                            right: ScreenUtil.instance.setWidth(16),
                            top: ScreenUtil.instance.setHeight(8),
                            bottom: ScreenUtil.instance.setHeight(8),
                          ),
                          decoration: BoxDecoration(
                            color: Styles.blackColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                ScreenUtil.instance.setHeight(30),
                              ),
                            ),
                            image: DecorationImage(
                              image: news.urlToImage != null
                                  ? NetworkImage(
                                      news.urlToImage,
                                    )
                                  //TODO add an default image
                                  : AssetImage(''),
                              fit: BoxFit.fill,
                            ),
                          ),
                          height: ScreenUtil.instance.setHeight(64),
                          width: ScreenUtil.instance.setHeight(64),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: CustomTextWidget(
                          news.title,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(8),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomTextWidget(news.description),
                  ),
                  SizedBox(
                    height: ScreenUtil.instance.setHeight(8),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomTextWidget(
                      news.url,
                      isTappable: true,
                      textStyle: TextStyle(
                        color: Styles.darkBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            isFav
                ? Container()
                : Positioned(
                    top: 0,
                    right: ScreenUtil.instance.setWidth(4),
                    child: BookMarkWidget(
                      news: news,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
