import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app/models/news.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse extends _NewsResponse with _$NewsResponse {
  static NewsResponse fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);

  static Map<String, dynamic> toJson(NewsResponse user) =>
      _$NewsResponseToJson(user);
}

abstract class _NewsResponse with Store {
  @observable
  Status status;

  @observable
  int totalResults;

  @observable
  List<News> articles;
}

enum Status { ok, error }
