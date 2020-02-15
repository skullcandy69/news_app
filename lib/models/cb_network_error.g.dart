// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cb_network_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CbNetworkError _$CbNetworkErrorFromJson(Map<String, dynamic> json) {
  return CbNetworkError()..message = json['message'] as String;
}

Map<String, dynamic> _$CbNetworkErrorToJson(CbNetworkError instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$CbNetworkError on _CbNetworkError, Store {
  final _$messageAtom = Atom(name: '_CbNetworkError.message');

  @override
  String get message {
    _$messageAtom.context.enforceReadPolicy(_$messageAtom);
    _$messageAtom.reportObserved();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.context.conditionallyRunInAction(() {
      super.message = value;
      _$messageAtom.reportChanged();
    }, _$messageAtom, name: '${_$messageAtom.name}_set');
  }
}
