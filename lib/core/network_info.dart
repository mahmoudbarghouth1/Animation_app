import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;
  NetworkInfo({required this.internetConnectionChecker});

  Future<bool> get isConnected {
    return internetConnectionChecker.hasConnection;
  }
}

// class NetworkInfoImpl implements NetworkInfo {
//   final InternetConnectionChecker internetConnectionChecker;

//   NetworkInfoImpl({required this.internetConnectionChecker});

//   @override
//   Future<bool> get isConnected => internetConnectionChecker.hasConnection;
// }
