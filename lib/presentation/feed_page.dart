import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/presentation/animation/provide_animation_widget.dart';
import 'package:news_app/presentation/custom/custom_scroll_Widget.dart';
import 'package:news_app/presentation/custom/store_observer.dart';
import 'package:news_app/presentation/favorite_widget.dart';
import 'package:news_app/presentation/news_feed_widget.dart';
import 'package:news_app/stores/user_store.dart';
import 'package:news_app/utils/string_value.dart';
import 'package:news_app/utils/styles.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  bool isFavoriteSelected;
  TextEditingController textEditingController = TextEditingController();
  Widget _widget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFavoriteSelected = true;
    _widget = NewsFeedWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.amber,
      child: Column(
        children: <Widget>[
          _appBar(),
          _searchBar(),
          _body(),
        ],
      ),
    );
  }

  Widget _appBar() {
    return Expanded(
      child: ProvideAnimation(
        transitionFormat: TransitionFormat.topToBottom,
        child: Container(
          padding: EdgeInsets.all(
            ScreenUtil.instance.setHeight(14),
          ),
          decoration: BoxDecoration(
            color: Styles.blueColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(
                ScreenUtil.instance.setHeight(88),
              ),
              bottomLeft: Radius.circular(
                ScreenUtil.instance.setHeight(88),
              ),
            ),
          ),
          child: CustomScrollWidget(
            firstTab: StringValue.newsFeed,
            secondTab: StringValue.favourite,
            isSelected: isFavoriteSelected,
            primaryColor: Styles.blueColor,
            secondaryColor: Styles.amber,
            onSelection: (bool value) {
              if (!value) {
                setState(() {
                  isFavoriteSelected = value;
                  _widget = FavoriteNewsWidget();
                });
              } else {
                setState(() {
                  isFavoriteSelected = value;
                  _widget = NewsFeedWidget();
                });
              }
            },
            rightPosition: 220,
            leftPosition: 60,
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return !isFavoriteSelected
        ? Container()
        : ProvideAnimation(
            transitionFormat: TransitionFormat.leftToRight,
            child: StoreObserver<UserStore>(
              builder: (UserStore userStore, BuildContext context) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil.instance.setWidth(32),
                    vertical: ScreenUtil.instance.setWidth(10),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil.instance.setWidth(8),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        ScreenUtil.instance.setHeight(24),
                      ),
                    ),
                    border: Border.all(
                      color: Styles.amber,
                      width: ScreenUtil.instance.setWidth(4),
                    ),
                    color: Styles.whiteColor,
                  ),
                  child: TextField(
                    controller: textEditingController,
                    onChanged: (String value) {
                      setState(() {});
                    },
                    style: TextStyle(),
                    decoration: InputDecoration(
                      hintText: 'Search For News Here',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(
                        ScreenUtil.instance.setHeight(10),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (isFavoriteSelected &&
                              textEditingController.text.isNotEmpty) {
                            WidgetsBinding.instance.addPostFrameCallback((d) {
                              userStore.fetchNewsEverything(
                                  keyWord: textEditingController.text);
                              textEditingController.clear();
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(
                            ScreenUtil.instance.setHeight(8),
                          ),
                          child: Icon(
                            Icons.search,
                            color: Styles.amber,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }

  Widget _body() {
    return Expanded(
      flex: 7,
      child: ProvideAnimation(
        transitionFormat: TransitionFormat.bottomToTop,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil.instance.setWidth(8),
            vertical: ScreenUtil.instance.setHeight(8),
          ),
          decoration: BoxDecoration(
            color: Styles.blueColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                ScreenUtil.instance.setHeight(88),
              ),
              topLeft: Radius.circular(
                ScreenUtil.instance.setHeight(24),
              ),
              bottomRight: Radius.circular(
                ScreenUtil.instance.setHeight(24),
              ),
              bottomLeft: Radius.circular(
                ScreenUtil.instance.setHeight(88),
              ),
            ),
          ),
          child: _widget,
        ),
      ),
    );
  }
}
