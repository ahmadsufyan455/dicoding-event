import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network_logger/network_logger.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  Dio dio() => Dio()..interceptors.add(DioNetworkLogger());

  @Named('baseUrl')
  String get baseUrl => 'https://event-api.dicoding.dev/';
}
