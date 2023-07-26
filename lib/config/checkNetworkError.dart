import 'dart:io';

import 'package:dio/dio.dart';
import 'package:track_genie_phase_2/config/strings.dart';

class CheckNetworkError {
  static final _sharedInstance = CheckNetworkError._internal();

  CheckNetworkError._internal();

  static CheckNetworkError getInstance() {
    return _sharedInstance;
  }

  static final _instance = CheckNetworkError.getInstance();

  String getNetworkError(DioError error) {
    print("CheckNetworkError${error}");
    print("CheckNetworkError${error.message}");
    print("CheckNetworkError${error.response?.statusCode}");
    print("CheckNetworkError${error.error}");


    ///1 - Connection failed error
    ///Please check your network connection
    ///2 - 400 Request error
    ///2 - 400 Request error
    ///3 - 500 internal server error

    if (error.message.toString().contains("SocketException")) {
      SocketException socketException = error.error as SocketException;
      return socketException.message;
    } else if (error.message.toString().contains("HandshakeException")) {
      HandshakeException handshakeException = error.error as HandshakeException;
      return handshakeException.message;
    } else if (error.message.toString().contains("DioError")) {
      DioErrorType dioErrorType = error.error as DioErrorType;
      return dioErrorType.name;
    } else if(error.type == DioErrorType.connectTimeout){
      return AppStrings.timeOutMsg;
    } else {
      if (error.response?.statusCode == 400) {
        return "Request error";
      } else if (error.response?.statusCode == 500) {
        return "Internal server error";
      } else if (error.response?.statusCode == 404) {
        return "404";
      }
    }
    return
      error
          .
      message;
  }
}
