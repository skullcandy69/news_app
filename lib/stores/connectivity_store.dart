import 'package:connectivity/connectivity.dart';
import 'package:mobx/mobx.dart';

part 'connectivity_store.g.dart';

class ConnectivityStore = _ConnectivityStore with _$ConnectivityStore;

abstract class _ConnectivityStore with Store {
  _ConnectivityStore() {
    checkConnectivity();
  }

  @observable
  bool isAppConnected = true;

  @observable
  bool isDialogOpen=false;

  @action
  updateAppConnected(bool isConnected) {
    isAppConnected = isConnected;
  }

  @action
  updateDialogOpen(bool isDialog) {
    isDialogOpen = isDialog;
  }

  checkConnectivity() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.none:
          updateAppConnected(false);
          break;

        default:
          updateAppConnected(true);
      }
    });
  }
}