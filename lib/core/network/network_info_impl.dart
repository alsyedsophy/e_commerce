import 'package:e_commerce/core/network/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl({required this.connectionChecker});
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
