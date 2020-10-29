
import 'package:connectivity/connectivity.dart';
import 'package:ytapi/enum/ConnectivityStatus.dart';

class ConnectivityServices {
  ConnectivityServices(Function setState) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      var connectivityStatus = getStatus(result);
      setState(connectivityStatus);
    });
  }

  ConnectivityStatus getStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Online;
      default:
        return ConnectivityStatus.Offline;
    }
  }
}
