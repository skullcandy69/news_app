// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News()
    ..id = json['id'] as int
    ..source = json['source'] == null
        ? null
        : Source.fromJson(json['source'] as Map<String, dynamic>)
    ..author = json['author'] as String
    ..title = json['title'] as String
    ..description = json['description'] as String
    ..url = json['url'] as String
    ..urlToImage = json['urlToImage'] as String
    ..publishedAt = json['publishedAt'] as String;
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$News on _News, Store {
  final _$idAtom = Atom(name: '_News.id');

  @override
  int get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$sourceAtom = Atom(name: '_News.source');

  @override
  Source get source {
    _$sourceAtom.context.enforceReadPolicy(_$sourceAtom);
    _$sourceAtom.reportObserved();
    return super.source;
  }

  @override
  set source(Source value) {
    _$sourceAtom.context.conditionallyRunInAction(() {
      super.source = value;
      _$sourceAtom.reportChanged();
    }, _$sourceAtom, name: '${_$sourceAtom.name}_set');
  }

  final _$authorAtom = Atom(name: '_News.author');

  @override
  String get author {
    _$authorAtom.context.enforceReadPolicy(_$authorAtom);
    _$authorAtom.reportObserved();
    return super.author;
  }

  @override
  set author(String value) {
    _$authorAtom.context.conditionallyRunInAction(() {
      super.author = value;
      _$authorAtom.reportChanged();
    }, _$authorAtom, name: '${_$authorAtom.name}_set');
  }

  final _$titleAtom = Atom(name: '_News.title');

  @override
  String get title {
    _$titleAtom.context.enforceReadPolicy(_$titleAtom);
    _$titleAtom.reportObserved();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.context.conditionallyRunInAction(() {
      super.title = value;
      _$titleAtom.reportChanged();
    }, _$titleAtom, name: '${_$titleAtom.name}_set');
  }

  final _$descriptionAtom = Atom(name: '_News.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$urlAtom = Atom(name: '_News.url');

  @override
  String get url {
    _$urlAtom.context.enforceReadPolicy(_$urlAtom);
    _$urlAtom.reportObserved();
    return super.url;
  }

  @override
  set url(String value) {
    _$urlAtom.context.conditionallyRunInAction(() {
      super.url = value;
      _$urlAtom.reportChanged();
    }, _$urlAtom, name: '${_$urlAtom.name}_set');
  }

  final _$urlToImageAtom = Atom(name: '_News.urlToImage');

  @override
  String get urlToImage {
    _$urlToImageAtom.context.enforceReadPolicy(_$urlToImageAtom);
    _$urlToImageAtom.reportObserved();
    return super.urlToImage;
  }

  @override
  set urlToImage(String value) {
    _$urlToImageAtom.context.conditionallyRunInAction(() {
      super.urlToImage = value;
      _$urlToImageAtom.reportChanged();
    }, _$urlToImageAtom, name: '${_$urlToImageAtom.name}_set');
  }

  final _$publishedAtAtom = Atom(name: '_News.publishedAt');

  @override
  String get publishedAt {
    _$publishedAtAtom.context.enforceReadPolicy(_$publishedAtAtom);
    _$publishedAtAtom.reportObserved();
    return super.publishedAt;
  }

  @override
  set publishedAt(String value) {
    _$publishedAtAtom.context.conditionallyRunInAction(() {
      super.publishedAt = value;
      _$publishedAtAtom.reportChanged();
    }, _$publishedAtAtom, name: '${_$publishedAtAtom.name}_set');
  }
}
