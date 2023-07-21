import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:track_genie_phase_2/config/Helper.dart';


class RequestResponseInspector extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Helper.getErrorLog('Request: ${options.method} ${options.uri}');
    Helper.getErrorLog('Headers: ${options.headers}');
    Helper.getErrorLog('Body: ${options.data}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Helper.getErrorLog('Response: ${response.statusCode}');
    Helper.getErrorLog('Response Data: ${jsonEncode(response.data)}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Helper.getErrorLog('Error: ${err.message}');
    return super.onError(err, handler);
  }
}
