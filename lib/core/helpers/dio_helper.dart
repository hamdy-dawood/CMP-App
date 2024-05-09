import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioManager {
  Dio? _dioInstance;

  Dio? get dio {
    _dioInstance ??= initDio();
    return _dioInstance;
  }

  Dio initDio() {
    final Dio dio = Dio(BaseOptions(
      // baseUrl: UrlsStrings.newBaseUrl,
      headers: <String, dynamic>{
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      connectTimeout: const Duration(seconds: 80),
      receiveTimeout: const Duration(seconds: 80),
    ));

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        request: true,
        responseBody: true,
        responseHeader: true,
        compact: true,
        maxWidth: 120,
      ));
    }
    return dio;
  }

  void update() => _dioInstance = initDio();

  Future<Response> get(String url,
      {Map<String, dynamic>? header, Map<String, dynamic>? json}) {
    return dio!
        .get(url, queryParameters: json, options: Options(headers: header));
  }

  Future<Response> post(String url,
      {Map<String, dynamic>? header, FormData? data}) {
    return dio!.post(url, data: data, options: Options(headers: header));
  }

  Future<Response> put(String url,
      {Map<String, dynamic>? header, dynamic data}) {
    return dio!.put(url, data: data, options: Options(headers: header));
  }

  Future<Response> delete(String url,
      {Map<String, dynamic>? header, dynamic data}) {
    return dio!.delete(url, data: data, options: Options(headers: header));
  }
}
