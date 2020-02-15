// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$ConnectivityStore on _ConnectivityStore, Store {
  final _$isAppConnectedAtom = Atom(name: '_ConnectivityStore.isAppConnected');

  @override
  bool get isAppConnected {
    _$isAppConnectedAtom.context.enforceReadPolicy(_$isAppConnectedAtom);
    _$isAppConnectedAtom.reportObserved();
    return super.isAppConnected;
  }

  @override
  set isAppConnected(bool value) {
    _$isAppConnectedAtom.context.conditionallyRunInAction(() {
      super.isAppConnected = value;
      _$isAppConnectedAtom.reportChanged();
    }, _$isAppConnectedAtom, name: '${_$isAppConnectedAtom.name}_set');
  }

  final _$isDialogOpenAtom = Atom(name: '_ConnectivityStore.isDialogOpen');

  @override
  bool get isDialogOpen {
    _$isDialogOpenAtom.context.enforceReadPolicy(_$isDialogOpenAtom);
    _$isDialogOpenAtom.reportObserved();
    return super.isDialogOpen;
  }

  @override
  set isDialogOpen(bool value) {
    _$isDialogOpenAtom.context.conditionallyRunInAction(() {
      super.isDialogOpen = value;
      _$isDialogOpenAtom.reportChanged();
    }, _$isDialogOpenAtom, name: '${_$isDialogOpenAtom.name}_set');
  }

  final _$_ConnectivityStoreActionController =
      ActionController(name: '_ConnectivityStore');

  @override
  dynamic updateAppConnected(bool isConnected) {
    final _$actionInfo = _$_ConnectivityStoreActionController.startAction();
    try {
      return super.updateAppConnected(isConnected);
    } finally {
      _$_ConnectivityStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateDialogOpen(bool isDialog) {
    final _$actionInfo = _$_ConnectivityStoreActionController.startAction();
    try {
      return super.updateDialogOpen(isDialog);
    } finally {
      _$_ConnectivityStoreActionController.endAction(_$actionInfo);
    }
  }
}
