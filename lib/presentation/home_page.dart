import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/presentation/animation/provide_animation_widget.dart';
import 'package:news_app/presentation/custom/custom_app_bar.dart';
import 'package:news_app/presentation/custom/custom_text_widget.dart';
import 'package:news_app/presentation/custom/news_list_widget.dart';
import 'package:news_app/presentation/custom/store_observer.dart';
import 'package:news_app/stores/user_store.dart';
import 'package:news_app/utils/globals.dart';
import 'package:news_app/utils/string_value.dart';
import 'package:news_app/utils/styles.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String routeNamed = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showTextField;
  TextEditingController textEditingController;
  Show show;
  NewsType newsType = NewsType.business;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
    showTextField = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.blueColor,
      child: Column(
        children: <Widget>[
          _appBar(),
          showTextField ? _showHiddenWidget() : SizedBox(),
          _body(),
        ],
      ),
    );
  }

  void _getData(BuildContext context, {NewsType news = NewsType.sports}) {
    UserStore userStore = Provider.of<UserStore>(context);
    userStore.fetchNewsHighlight(newsType: news);
  }

  List<News> searchResult(List<News> news) {
    if (textEditingController.text.isEmpty) {
      return news;
    } else {
      return news
          .where((b) => b.title.contains(textEditingController.text) == null
              ? false
              : b.title.contains(textEditingController.text))
          .toList();
    }
  }

  Widget _appBar() {
    return Expanded(
      flex: 4,
      child: ProvideAnimation(
        transitionFormat: TransitionFormat.topToBottom,
        child: CustomAppBar(
          showTextField: showTextField,
          show: show,
          setTextFieldVisibility: (bool value, Show s) {
            setState(() {
              showTextField = value;
              show = s;
            });
          },
        ),
      ),
    );
  }

  Widget _body() {
    return Expanded(
      flex: 33,
      child: ProvideAnimation(
        transitionFormat: TransitionFormat.bottomToTop,
        child: Container(
          padding: EdgeInsets.only(
            top: ScreenUtil.instance.setHeight(16),
            left: ScreenUtil.instance.setHeight(24),
            right: ScreenUtil.instance.setHeight(24),
          ),
          margin: EdgeInsets.only(
            left: ScreenUtil.instance.setHeight(8),
            right: ScreenUtil.instance.setHeight(8),
            top: ScreenUtil.instance.setHeight(8),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                ScreenUtil.instance.setWidth(88),
              ),
              bottomRight: Radius.circular(
                ScreenUtil.instance.setWidth(88),
              ),
              topRight: Radius.circular(
                ScreenUtil.instance.setWidth(8),
              ),
              bottomLeft: Radius.circular(
                ScreenUtil.instance.setWidth(8),
              ),
            ),
            color: Styles.amber,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: ScreenUtil.instance.setHeight(24),
              ),
              Flexible(
                flex: 1,
                child: CustomTextWidget(
                  StringValue.highlights,
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Styles.smallFont),
                ),
              ),
              _bottomBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomBody() {
    return StoreObserver<UserStore>(
      builder: (UserStore userStore, BuildContext context) {
        if (!userStore.isNewsHighlightLoading &&
            userStore.newsResponseHighlight == null) {
          _getData(context);
        }

        return Expanded(
          flex: 10,
          child: userStore.isNewsHighlightLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding: EdgeInsets.all(
                    ScreenUtil.instance.setHeight(16),
                  ),
                  child: userStore.newsResponseHighlight.status ==
                              Status.error ||
                          userStore.newsResponseHighlight.articles.isEmpty
                      ? Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                flex: 1,
                                child: CustomTextWidget(
                                  StringValue.emptyFeed,
                                  textStyle: TextStyle(
                                    color: Styles.redColor,
                                    fontSize: Styles.smallFont,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil.instance.setHeight(16),
                              ),
                            ],
                          ),
                        )
                      : searchResult(userStore.newsResponseHighlight.articles
                                  .toList())
                              .isEmpty
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
                              searchResult(userStore
                                  .newsResponseHighlight.articles
                                  .toList()),
                              userStore.isNewsHighlightLoading,
                              FetchMoreNews: userStore.hasMoreNewsHighlight,
                            ),
                ),
        );
      },
    );
  }

  Widget _showHiddenWidget() {
    return Expanded(
      flex: 4,
      child: ProvideAnimation(
        key: Key(
          describeEnum(show),
        ),
        transitionFormat: TransitionFormat.topToBottom,
        child: show == Show.text
            ? Container(
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
                    border: InputBorder.none,
                    hintText: 'Search For News Here Among Highlights',
                    contentPadding: EdgeInsets.all(
                      ScreenUtil.instance.setHeight(10),
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        WidgetsBinding.instance.addPostFrameCallback((d) {
                          textEditingController.clear();
                        });
                        FocusScope.of(context).requestFocus(FocusNode());
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
              )
            : Container(
                color: Styles.transparent,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
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
                      child: DropdownButton<NewsType>(
                        value: newsType,
                        onChanged: (NewsType newValue) {
                          textEditingController.clear();
                          setState(() {
                            newsType = newValue;
                          });
                        },
                        items: NewsType.values
                            .map<DropdownMenuItem<NewsType>>((NewsType value) {
                          return DropdownMenuItem<NewsType>(
                            value: value,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil.instance.setWidth(16),
                              ),
                              child: Text(
                                describeEnum(value),
                                style: TextStyle(
                                  color: Styles.blueColor,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil.instance.setWidth(16),
                    ),
                    InkWell(
                      onTap: () {
                        _getData(
                          context,
                          news: newsType,
                        );
                        setState(() {
                          showTextField = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(
                          ScreenUtil.instance.setWidth(10),
                        ),
                        decoration: BoxDecoration(
                          color: Styles.amber,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              ScreenUtil.instance.setHeight(24),
                            ),
                          ),
                        ),
                        child: Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
