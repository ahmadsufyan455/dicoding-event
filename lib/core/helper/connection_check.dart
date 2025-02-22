import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> hasInternet() async {
  final connectivityResults = await Connectivity().checkConnectivity();
  return connectivityResults.isNotEmpty &&
      !connectivityResults.contains(ConnectivityResult.none);
}
