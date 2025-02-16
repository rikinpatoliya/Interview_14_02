import 'package:dio/dio.dart';

import 'awesome_dio_interceptor.dart';
import 'header_interceptor.dart';

class DioProvider {
  static const String baseUrl = 'https://theflowerhub.co.nz/';

  static Dio? _instance;

  static final _prettyDioLogger = AwesomeDioInterceptor(
    logRequestTimeout: false,
    logRequestHeaders: true,
    logResponseHeaders: true,
  );

  static final BaseOptions _options = BaseOptions(
    // baseUrl: Config.getBaseUrl,
    baseUrl: baseUrl,
    connectTimeout: const Duration(minutes: 1),
    receiveTimeout: const Duration(minutes: 1),
  );

  static Dio get httpDio {
    if (_instance == null) {
      _instance = Dio(_options);

      _instance!.interceptors.add(_prettyDioLogger);
      _instance!.interceptors.add(HeaderInterceptorsWrapper());

      return _instance!;
    } else {
      _instance!.interceptors.clear();
      _instance!.interceptors.add(_prettyDioLogger);
      _instance!.interceptors.add(HeaderInterceptorsWrapper());

      return _instance!;
    }
  }
}
