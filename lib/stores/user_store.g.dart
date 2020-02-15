// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$UserStore on _UserStore, Store {
  final _$isNewsHighlightLoadingAtom =
      Atom(name: '_UserStore.isNewsHighlightLoading');

  @override
  bool get isNewsHighlightLoading {
    _$isNewsHighlightLoadingAtom.context
        .enforceReadPolicy(_$isNewsHighlightLoadingAtom);
    _$isNewsHighlightLoadingAtom.reportObserved();
    return super.isNewsHighlightLoading;
  }

  @override
  set isNewsHighlightLoading(bool value) {
    _$isNewsHighlightLoadingAtom.context.conditionallyRunInAction(() {
      super.isNewsHighlightLoading = value;
      _$isNewsHighlightLoadingAtom.reportChanged();
    }, _$isNewsHighlightLoadingAtom,
        name: '${_$isNewsHighlightLoadingAtom.name}_set');
  }

  final _$isFetchingLocalAtom = Atom(name: '_UserStore.isFetchingLocal');

  @override
  bool get isFetchingLocal {
    _$isFetchingLocalAtom.context.enforceReadPolicy(_$isFetchingLocalAtom);
    _$isFetchingLocalAtom.reportObserved();
    return super.isFetchingLocal;
  }

  @override
  set isFetchingLocal(bool value) {
    _$isFetchingLocalAtom.context.conditionallyRunInAction(() {
      super.isFetchingLocal = value;
      _$isFetchingLocalAtom.reportChanged();
    }, _$isFetchingLocalAtom, name: '${_$isFetchingLocalAtom.name}_set');
  }

  final _$hasMoreLocalAtom = Atom(name: '_UserStore.hasMoreLocal');

  @override
  bool get hasMoreLocal {
    _$hasMoreLocalAtom.context.enforceReadPolicy(_$hasMoreLocalAtom);
    _$hasMoreLocalAtom.reportObserved();
    return super.hasMoreLocal;
  }

  @override
  set hasMoreLocal(bool value) {
    _$hasMoreLocalAtom.context.conditionallyRunInAction(() {
      super.hasMoreLocal = value;
      _$hasMoreLocalAtom.reportChanged();
    }, _$hasMoreLocalAtom, name: '${_$hasMoreLocalAtom.name}_set');
  }

  final _$isNewsEverythingLoadingAtom =
      Atom(name: '_UserStore.isNewsEverythingLoading');

  @override
  bool get isNewsEverythingLoading {
    _$isNewsEverythingLoadingAtom.context
        .enforceReadPolicy(_$isNewsEverythingLoadingAtom);
    _$isNewsEverythingLoadingAtom.reportObserved();
    return super.isNewsEverythingLoading;
  }

  @override
  set isNewsEverythingLoading(bool value) {
    _$isNewsEverythingLoadingAtom.context.conditionallyRunInAction(() {
      super.isNewsEverythingLoading = value;
      _$isNewsEverythingLoadingAtom.reportChanged();
    }, _$isNewsEverythingLoadingAtom,
        name: '${_$isNewsEverythingLoadingAtom.name}_set');
  }

  final _$hasMoreNewsHighlightAtom =
      Atom(name: '_UserStore.hasMoreNewsHighlight');

  @override
  bool get hasMoreNewsHighlight {
    _$hasMoreNewsHighlightAtom.context
        .enforceReadPolicy(_$hasMoreNewsHighlightAtom);
    _$hasMoreNewsHighlightAtom.reportObserved();
    return super.hasMoreNewsHighlight;
  }

  @override
  set hasMoreNewsHighlight(bool value) {
    _$hasMoreNewsHighlightAtom.context.conditionallyRunInAction(() {
      super.hasMoreNewsHighlight = value;
      _$hasMoreNewsHighlightAtom.reportChanged();
    }, _$hasMoreNewsHighlightAtom,
        name: '${_$hasMoreNewsHighlightAtom.name}_set');
  }

  final _$hasMoreNewsEverythingAtom =
      Atom(name: '_UserStore.hasMoreNewsEverything');

  @override
  bool get hasMoreNewsEverything {
    _$hasMoreNewsEverythingAtom.context
        .enforceReadPolicy(_$hasMoreNewsEverythingAtom);
    _$hasMoreNewsEverythingAtom.reportObserved();
    return super.hasMoreNewsEverything;
  }

  @override
  set hasMoreNewsEverything(bool value) {
    _$hasMoreNewsEverythingAtom.context.conditionallyRunInAction(() {
      super.hasMoreNewsEverything = value;
      _$hasMoreNewsEverythingAtom.reportChanged();
    }, _$hasMoreNewsEverythingAtom,
        name: '${_$hasMoreNewsEverythingAtom.name}_set');
  }

  final _$newsResponseHighlightAtom =
      Atom(name: '_UserStore.newsResponseHighlight');

  @override
  NewsResponse get newsResponseHighlight {
    _$newsResponseHighlightAtom.context
        .enforceReadPolicy(_$newsResponseHighlightAtom);
    _$newsResponseHighlightAtom.reportObserved();
    return super.newsResponseHighlight;
  }

  @override
  set newsResponseHighlight(NewsResponse value) {
    _$newsResponseHighlightAtom.context.conditionallyRunInAction(() {
      super.newsResponseHighlight = value;
      _$newsResponseHighlightAtom.reportChanged();
    }, _$newsResponseHighlightAtom,
        name: '${_$newsResponseHighlightAtom.name}_set');
  }

  final _$newsResponseEverythingAtom =
      Atom(name: '_UserStore.newsResponseEverything');

  @override
  NewsResponse get newsResponseEverything {
    _$newsResponseEverythingAtom.context
        .enforceReadPolicy(_$newsResponseEverythingAtom);
    _$newsResponseEverythingAtom.reportObserved();
    return super.newsResponseEverything;
  }

  @override
  set newsResponseEverything(NewsResponse value) {
    _$newsResponseEverythingAtom.context.conditionallyRunInAction(() {
      super.newsResponseEverything = value;
      _$newsResponseEverythingAtom.reportChanged();
    }, _$newsResponseEverythingAtom,
        name: '${_$newsResponseEverythingAtom.name}_set');
  }

  final _$favNewsAtom = Atom(name: '_UserStore.favNews');

  @override
  ObservableList<News> get favNews {
    _$favNewsAtom.context.enforceReadPolicy(_$favNewsAtom);
    _$favNewsAtom.reportObserved();
    return super.favNews;
  }

  @override
  set favNews(ObservableList<News> value) {
    _$favNewsAtom.context.conditionallyRunInAction(() {
      super.favNews = value;
      _$favNewsAtom.reportChanged();
    }, _$favNewsAtom, name: '${_$favNewsAtom.name}_set');
  }

  final _$newsResponseHighlightMapAtom =
      Atom(name: '_UserStore.newsResponseHighlightMap');

  @override
  ObservableMap<NewsType, NewsResponse> get newsResponseHighlightMap {
    _$newsResponseHighlightMapAtom.context
        .enforceReadPolicy(_$newsResponseHighlightMapAtom);
    _$newsResponseHighlightMapAtom.reportObserved();
    return super.newsResponseHighlightMap;
  }

  @override
  set newsResponseHighlightMap(ObservableMap<NewsType, NewsResponse> value) {
    _$newsResponseHighlightMapAtom.context.conditionallyRunInAction(() {
      super.newsResponseHighlightMap = value;
      _$newsResponseHighlightMapAtom.reportChanged();
    }, _$newsResponseHighlightMapAtom,
        name: '${_$newsResponseHighlightMapAtom.name}_set');
  }

  final _$newsResponseEverythingMapAtom =
      Atom(name: '_UserStore.newsResponseEverythingMap');

  @override
  ObservableMap<String, NewsResponse> get newsResponseEverythingMap {
    _$newsResponseEverythingMapAtom.context
        .enforceReadPolicy(_$newsResponseEverythingMapAtom);
    _$newsResponseEverythingMapAtom.reportObserved();
    return super.newsResponseEverythingMap;
  }

  @override
  set newsResponseEverythingMap(ObservableMap<String, NewsResponse> value) {
    _$newsResponseEverythingMapAtom.context.conditionallyRunInAction(() {
      super.newsResponseEverythingMap = value;
      _$newsResponseEverythingMapAtom.reportChanged();
    }, _$newsResponseEverythingMapAtom,
        name: '${_$newsResponseEverythingMapAtom.name}_set');
  }

  final _$fetchFavNewsAsyncAction = AsyncAction('fetchFavNews');

  @override
  Future<dynamic> fetchFavNews() {
    return _$fetchFavNewsAsyncAction.run(() => super.fetchFavNews());
  }

  final _$fetchNewsHighlightAsyncAction = AsyncAction('fetchNewsHighlight');

  @override
  Future<dynamic> fetchNewsHighlight({NewsType newsType, String keyWord}) {
    return _$fetchNewsHighlightAsyncAction.run(
        () => super.fetchNewsHighlight(newsType: newsType, keyWord: keyWord));
  }

  final _$fetchNewsHighlightMoreAsyncAction =
      AsyncAction('fetchNewsHighlightMore');

  @override
  Future<dynamic> fetchNewsHighlightMore({NewsType newsType, String keyWord}) {
    return _$fetchNewsHighlightMoreAsyncAction.run(() =>
        super.fetchNewsHighlightMore(newsType: newsType, keyWord: keyWord));
  }

  final _$fetchNewsEverythingAsyncAction = AsyncAction('fetchNewsEverything');

  @override
  Future<dynamic> fetchNewsEverything({String keyWord = 'juice'}) {
    return _$fetchNewsEverythingAsyncAction
        .run(() => super.fetchNewsEverything(keyWord: keyWord));
  }

  final _$fetchNewsEverythingMoreAsyncAction =
      AsyncAction('fetchNewsEverythingMore');

  @override
  Future<dynamic> fetchNewsEverythingMore({String keyWord = 'juice'}) {
    return _$fetchNewsEverythingMoreAsyncAction
        .run(() => super.fetchNewsEverythingMore(keyWord: keyWord));
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  void storeFavoriteNews(News news) {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.storeFavoriteNews(news);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sortNewResponse() {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.sortNewResponse();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }
}
