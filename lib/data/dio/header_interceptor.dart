import 'dart:async';

import 'package:dio/dio.dart';

class HeaderInterceptorsWrapper extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }
}
