import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app/models/cb_network_error.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/utils/globals.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  bool isNewsHighlightLoading = false;

  @observable
  bool isFetchingLocal = false;

  @observable
  bool hasMoreLocal = true;

  @observable
  bool isNewsEverythingLoading = false;

  @observable
  bool hasMoreNewsHighlight = true;

  @observable
  bool hasMoreNewsEverything = true;

  @observable
  NewsResponse newsResponseHighlight;

  @observable
  NewsResponse newsResponseEverything;

  @observable
  ObservableList<News> favNews = ObservableList<News>();

  @observable
  ObservableMap<NewsType, NewsResponse> newsResponseHighlightMap =
      ObservableMap<NewsType, NewsResponse>();

  @observable
  ObservableMap<String, NewsResponse> newsResponseEverythingMap =
      ObservableMap<String, NewsResponse>();

  @action
  Future fetchFavNews() async {
    isFetchingLocal = true;
    try {
      List<News> list = await databaseHelper.getNews();
      if (list.isEmpty) {
        hasMoreLocal = false;
      }
      print('data is ${list}');
      favNews = ObservableList.of(list);
      isFetchingLocal = false;
    } on CbNetworkError {
      isFetchingLocal = false;
    } catch (e) {
      print(e.toString());
      isFetchingLocal = false;
    }
  }

  @action
  Future fetchNewsHighlight({NewsType newsType, String keyWord}) async {
    try {
      if (newsResponseHighlightMap.keys.contains(newsType)) {
        newsResponseHighlight = newsResponseHighlightMap[newsType];
      } else {
        isNewsHighlightLoading = true;

        newsResponseHighlight = await userService.getAllNewsHighlight(
          category: describeEnum(newsType),
          keyWord: keyWord,
        );
        newsResponseHighlightMap.addAll({newsType: newsResponseHighlight});
      }
      isNewsHighlightLoading = false;
    } on CbNetworkError {
      isNewsHighlightLoading = false;
    } catch (e) {
      print(e.toString());
      isNewsHighlightLoading = false;
    }
  }

  @action
  Future fetchNewsHighlightMore({NewsType newsType, String keyWord}) async {
    try {
      isNewsHighlightLoading = true;
      int length = newsResponseHighlight.articles.length + 10;
      newsResponseHighlight = await userService.getAllNewsHighlight(
          category: describeEnum(newsType),
          keyWord: keyWord,
          pageSize: hasMoreNewsHighlight
              ? newsResponseHighlight.articles.length + 10
              : 30,
          page: !hasMoreNewsHighlight ? 2 : 1);
      if (length > newsResponseHighlight.articles.length) {
        hasMoreNewsHighlight = false;
      }
      newsResponseHighlightMap.addAll({newsType: newsResponseHighlight});
      isNewsHighlightLoading = false;
    } on CbNetworkError {
      isNewsHighlightLoading = false;
    } catch (e) {
      print(e.toString());
      isNewsHighlightLoading = false;
    }
  }

  @action
  Future fetchNewsEverything({String keyWord = 'juice'}) async {
    try {
//    if (newsResponseEverythingMap.keys.contains(keyWord)) {
//      newsResponseEverything = newsResponseEverythingMap[keyWord];
//    } else {

      isNewsEverythingLoading = true;

      newsResponseEverything = await userService.getAllNewsEverything(
        keyWord: keyWord,
      );
//      newsResponseEverythingMap.addAll({keyWord: newsResponseHighlight});
//    }
      isNewsEverythingLoading = false;
    } on CbNetworkError {
      isNewsEverythingLoading = false;
    } catch (e) {
      print(e.toString());
      isNewsEverythingLoading = false;
    }
  }

  @action
  Future fetchNewsEverythingMore({
    String keyWord = 'juice',
  }) async {
    try {
      isNewsEverythingLoading = true;
      int length = newsResponseEverything.articles.length + 10;
      newsResponseEverything = await userService.getAllNewsEverything(
        keyWord: keyWord,
      );
      if (length > newsResponseEverything.articles.length) {
        hasMoreNewsEverything = false;
      }
      newsResponseEverythingMap.addAll({keyWord: newsResponseHighlight});
      isNewsEverythingLoading = false;
    } on CbNetworkError {
      isNewsEverythingLoading = false;
    } catch (e) {
      print(e.toString());
      isNewsEverythingLoading = false;
    }
  }

  @action
  void storeFavoriteNews(News news) {
    databaseHelper.insertNews(news).then((v) {
      print('news is ${News.toJson(news)}');
      news.id = v;
      print('news is ${News.toJson(news)}');
      favNews.add(news);
    });
  }

  @action
  void sortNewResponse() {
    isNewsHighlightLoading = true;
    newsResponseHighlight.articles.sort((News a, News b) {
      return a.publishedAt.compareTo(b.publishedAt);
    });
    isNewsHighlightLoading = false;
  }
}

enum NewsType {
  business,
  health,
  science,
  sports,
  technology,
  entertainment,
  general
}

enum NewsEverythingType {
  domains,
  language,
}
