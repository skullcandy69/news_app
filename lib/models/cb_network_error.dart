import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'cb_network_error.g.dart';

@JsonSerializable()
class CbNetworkError extends _CbNetworkError with _$CbNetworkError {
  static CbNetworkError fromJson(Map<String, dynamic> json) =>
      _$CbNetworkErrorFromJson(json);

  static Map<String, dynamic> toJson(CbNetworkError error) =>
      _$CbNetworkErrorToJson(error);
}

abstract class _CbNetworkError with Store {
  @observable
  String message;
}
