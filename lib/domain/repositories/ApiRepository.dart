import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../../data/datasources/network/RequestResponseInspector.dart';
import '../../data/datasources/network/retrofitClient.dart';

class ApiRepository {
  static final _sharedInstance = ApiRepository._internal();

  ApiRepository._internal();
  static Dio dio = Dio(BaseOptions(connectTimeout: 30 * 1000));

  static late RestClient client;

  static ApiRepository getInstance(String token) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["authToken"] = token;
    dio.interceptors.add(RequestResponseInspector());
    client = RestClient(dio);
    return _sharedInstance;
  }

  // Future<LoginResponse?> authenticateUser(LoginRequest request) async {
  //   return await ApiRepository.client.authenticateUser(request);
  // }
}
