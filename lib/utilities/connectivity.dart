import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rxdart/rxdart.dart';

class ConnectivityManager {
  /// Singleton
  static ConnectivityManager shared = ConnectivityManager._();

  /// Stream Controller
  // ignore: close_sinks
  final _streamController = BehaviorSubject<ConnectivityStatus>.seeded(ConnectivityStatus.unknown);
  Stream<ConnectivityStatus> get connectionStatus => _streamController.stream;

  final Connectivity _connectivity = Connectivity();

  /// Private Constructor
  ConnectivityManager._() {
    // Refresh the connection status every 5 seconds
    Stream.periodic(const Duration(seconds: 5)).listen((_) async {
      final result = await _connectivity.checkConnectivity();
      _setConnectivityStatus(result);
    });

    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) => _setConnectivityStatus(result));
  }

  /// Helper Method - [doInitialCheck]
  /// Get the connectivity status and set it to stream.
  void doInitialCheck() async {
    final result = await _connectivity.checkConnectivity();
    _setConnectivityStatus(result);
  }

  /// Helper Method - [_setConnectivityStatus]
  void _setConnectivityStatus(ConnectivityResult result) {
    // ignore: unnecessary_null_comparison
    if (result == null) return;
    final status = _getStatusFromResult(result);
    //print("Connectivity Status : ${status.toString()}");
    _streamController.sink.add(status);
  }

  /// Helper Method - [getRawStatus]
  /// Return the Connectivity Status in Raw String format
  String getRawStatus() => _streamController.value.toString().split('.').last.toLowerCase();

  /// Helper Method - [isAvailable]
  /// Return true if network is available, Otherwise false.
  bool isAvailable() =>
      (_streamController.value == ConnectivityStatus.wiFi || _streamController.value == ConnectivityStatus.cellular);

  /// Helper Method - [isNotAvailable]
  /// Return true if network is not available. Otherwise false.
  bool isNotAvailable() => !isAvailable();

  /// Helper Method - [_getStatusFromResult]
  /// Convert from the third part enum to our own enum
  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.wiFi;
      case ConnectivityResult.none:
        return ConnectivityStatus.offline;
      default:
        return ConnectivityStatus.offline;
    }
  }
}

/// Helper Enum - [ConnectivityStatus]
enum ConnectivityStatus { wiFi, cellular, offline, unknown }
