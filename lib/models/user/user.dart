import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends _User with _$User {
  static User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static Map<String, dynamic> toJson(User user) => _$UserToJson(user);
}

abstract class _User with Store {
  @observable
  int id;

  @observable
  String name;

  @observable
  @JsonKey(name: 'phone_number')
  String phoneNumber;

  @JsonKey(name: 'organization_id')
  int organizationId;

  @observable
  @JsonKey(name: 'created_at')
  String createdAt;

  @observable
  @JsonKey(name: 'updated_at')
  String updatedAt;
}
