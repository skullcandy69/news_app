// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) {
  return NewsResponse()
    ..status = _$enumDecodeNullable(_$StatusEnumMap, json['status'])
    ..totalResults = json['totalResults'] as int
    ..articles = (json['articles'] as List)
        ?.map(
            (e) => e == null ? null : News.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$NewsResponseToJson(NewsResponse instance) =>
    <String, dynamic>{
      'status': _$StatusEnumMap[instance.status],
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$StatusEnumMap = {
  Status.ok: 'ok',
  Status.error: 'error',
};

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$NewsResponse on _NewsResponse, Store {
  final _$statusAtom = Atom(name: '_NewsResponse.status');

  @override
  Status get status {
    _$statusAtom.context.enforceReadPolicy(_$statusAtom);
    _$statusAtom.reportObserved();
    return super.status;
  }

  @override
  set status(Status value) {
    _$statusAtom.context.conditionallyRunInAction(() {
      super.status = value;
      _$statusAtom.reportChanged();
    }, _$statusAtom, name: '${_$statusAtom.name}_set');
  }

  final _$totalResultsAtom = Atom(name: '_NewsResponse.totalResults');

  @override
  int get totalResults {
    _$totalResultsAtom.context.enforceReadPolicy(_$totalResultsAtom);
    _$totalResultsAtom.reportObserved();
    return super.totalResults;
  }

  @override
  set totalResults(int value) {
    _$totalResultsAtom.context.conditionallyRunInAction(() {
      super.totalResults = value;
      _$totalResultsAtom.reportChanged();
    }, _$totalResultsAtom, name: '${_$totalResultsAtom.name}_set');
  }

  final _$articlesAtom = Atom(name: '_NewsResponse.articles');

  @override
  List<News> get articles {
    _$articlesAtom.context.enforceReadPolicy(_$articlesAtom);
    _$articlesAtom.reportObserved();
    return super.articles;
  }

  @override
  set articles(List<News> value) {
    _$articlesAtom.context.conditionallyRunInAction(() {
      super.articles = value;
      _$articlesAtom.reportChanged();
    }, _$articlesAtom, name: '${_$articlesAtom.name}_set');
  }
}
