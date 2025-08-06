import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:frontend/Core/Utils/log_util.dart';
import 'package:get/state_manager.dart';

class ConnectionManagerController extends GetxController {
  var isConnected = false.obs;
  final Connectivity _connectivity = Connectivity();

  late StreamSubscription _streamSubscription;

  @override
  void onInit() {
    getConnectionType();
    _streamSubscription = _connectivity.onConnectivityChanged.listen(
      _updateState,
      onError: (error) {
        Log.e("The Connectivity Listener Error", error.toString());
      },
    );
    super.onInit();
  }

  Future<void> getConnectionType() async {
    List<ConnectivityResult> connectivityResult = [];
    try {
      connectivityResult = await _connectivity.checkConnectivity();
      _updateState(connectivityResult);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  _updateState(List<ConnectivityResult> result) {
    switch (result.first) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        isConnected.value = true;
        break;
      case ConnectivityResult.none:
      default:
        isConnected.value = false;
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
    super.onClose();
  }
}
