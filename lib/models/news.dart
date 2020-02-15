import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app/models/source.dart';

part 'news.g.dart';

@JsonSerializable()
class News extends _News with _$News {
  static News fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  static Map<String, dynamic> toJson(News user) => _$NewsToJson(user);
}

abstract class _News with Store {
  @observable
  int id;

  @observable
  Source source;

  @observable
  @JsonKey(nullable: true)
  String author;

  @observable
  String title;

  @observable
  String description;

  @observable
  @JsonKey(nullable: true)
  String url;

  @observable
  @JsonKey(nullable: true)
  String urlToImage;

  @observable
  String publishedAt;
}
