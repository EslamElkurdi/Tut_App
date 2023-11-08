import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tut_app/app/constants.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {

  Future<Dio> getDio() async {

    Dio dio = Dio();



    Duration _timeOut = const Duration(minutes: 1);

    Map<String, String> headers = {
      CONTENT_TYPE : APPLICATION_JSON,
      ACCEPT : APPLICATION_JSON,
      AUTHORIZATION : "SEND TOKEN HERE",
      DEFAULT_LANGUAGE : "en" // todo get lang from app prefs
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      receiveTimeout: _timeOut,
      sendTimeout: _timeOut
    );

    if(!kReleaseMode){ // its debug mode so print logs
      dio.interceptors.add(
          PrettyDioLogger(
            requestHeader : true,
            requestBody : true,
            responseHeader : true,
          )
      );
    }

    return dio;
  }
}