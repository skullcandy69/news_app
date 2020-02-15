import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/presentation/custom/news_list_widget.dart';
import 'package:news_app/presentation/custom/store_observer.dart';
import 'package:news_app/stores/user_store.dart';
import 'package:news_app/utils/string_value.dart';
import 'package:news_app/utils/styles.dart';

class NewsFeedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreObserver<UserStore>(
      builder: (UserStore userStore, BuildContext context) {
        if (!userStore.isNewsEverythingLoading &&
            userStore.newsResponseEverything == null) {
          userStore.fetchNewsEverything(keyWord: 'juice');
        }
        return userStore.isNewsEverythingLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil.instance.setHeight(16),
                  horizontal: ScreenUtil.instance.setWidth(32),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: ScreenUtil.instance.setWidth(8),
                ),
                child: userStore.newsResponseEverything.articles.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: ScreenUtil.instance.setHeight(100),
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/image.jpeg'),
                            )),
                          ),
                          Center(
                            child: Text(
                              StringValue.emptyFeed,
                              style: TextStyle(
                                  color: Styles.redColor,
                                  fontSize: Styles.smallFont),
                            ),
                          ),
                        ],
                      )
                    : NewsListWidget(
                        userStore.newsResponseEverything.articles,
                        userStore.isNewsEverythingLoading,
                        isHome: false,
                      ),
              );
      },
    );
  }
}
