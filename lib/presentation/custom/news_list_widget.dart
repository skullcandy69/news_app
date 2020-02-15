import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/presentation/custom/news_card_widget.dart';
import 'package:news_app/utils/string_value.dart';
import 'package:news_app/utils/styles.dart';

class NewsListWidget extends StatelessWidget {
  final List<News> news;
  final bool isFetching;
  final bool isHome;
  final bool isFavoriteList;
  final bool FetchMoreNews;

  NewsListWidget(this.news, this.isFetching,
      {this.FetchMoreNews, this.isFavoriteList = false,this.isHome=true});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return news.isEmpty
            ? Center(
                child: Text(StringValue.emptyFeed,
                    style: TextStyle(
                      fontSize: Styles.smallFont,
                      color: Styles.redColor,
                    )),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  NewsCard(
                    news[index],
                    isHome: !isFavoriteList&&isHome,
                    isFav: isFavoriteList,
                  ),
                  index == news.length - 1
                      ? SizedBox(
                          height: ScreenUtil.instance.setHeight(80),
                        )
                      : SizedBox(
                          height: ScreenUtil.instance.setHeight(8),
                        ),
                  isFetching
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : SizedBox(),
                ],
              );
      },
      itemCount: news.length,
    );
  }
}
