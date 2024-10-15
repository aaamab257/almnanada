import 'dart:async';
import 'package:almanada_app/services/local_db_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static final DioFactory _instance = DioFactory._internal();
  factory DioFactory() => _instance;

  late Dio dio;
  CancelToken cancelToken = CancelToken();

  Map<String, dynamic>? _authorization() {
    final headers = <String, dynamic>{};
    final token = LocalDBService.to.getParentToken;
    if (token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  DioFactory._internal() {
    BaseOptions options = BaseOptions(
      // baseUrl: EndPoints.baseUrl,
      // connectTimeout: 20000,
      // receiveTimeout: 20000,
      headers: {'Accept': 'application/json'},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    dio = Dio(options);
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
        ),
      );
      /* dio.interceptors.add(
        LogInterceptor(
          error: true,
          request: true,
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
        ),
      ); */
    }
    /* dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            options.headers['Authorization'] = 'Bearer your_access_token';
            return handler.next(options);
          },
          onError: (DioError e, handler) async {
            if (e.response?.statusCode == 401) {
              return handler.reject(e);
            }
            return handler.next(e);
          },
        ),
      ); */
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) => handler.next(options),
        onResponse: (response, handler) => handler.next(response),
        onError: (DioError dioError, handler) {
          return handler.next(dioError);
        },
      ),
    );
  }

  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool refresh = false,
    bool list = false,
    String cacheKey = '',
    bool cacheDisk = false,
    Map<String, dynamic>? headers,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.extra ??= {};
    requestOptions.extra!.addAll({
      "refresh": refresh,
      "list": list,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });
    requestOptions.headers = requestOptions.headers ?? {};

    if (headers != null) {
      requestOptions.headers!.addAll(headers);
    } else {
      Map<String, dynamic>? authorization = _authorization();
      if (authorization != null) {
        requestOptions.headers!.addAll(authorization);
      }
    }
    Response<dynamic> response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  Future<Response<dynamic>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    if (headers != null) {
      requestOptions.headers?.addAll(headers);
    } else {
      Map<String, dynamic>? authorization = _authorization();
      if (authorization != null) {
        requestOptions.headers?.addAll(authorization);
      }
    }

    Response<dynamic> response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  Future put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = _authorization();
    if (authorization != null) {
      requestOptions.headers?.addAll(authorization);
    }
    Response response = await dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = _authorization();
    if (authorization != null) {
      requestOptions.headers?.addAll(authorization);
    }
    Response response = await dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = _authorization();
    if (authorization != null) {
      requestOptions.headers?.addAll(authorization);
    }
    Response response = await dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  Future postForm(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    if (headers != null) {
      requestOptions.headers?.addAll(headers);
    } else {
      Map<String, dynamic>? authorization = _authorization();
      if (authorization != null) {
        requestOptions.headers?.addAll(authorization);
      }
    }
    Response response = await dio.post(
      path,
      data: FormData.fromMap(data),
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  Future postStream(
    String path, {
    dynamic data,
    int dataLength = 0,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = _authorization();
    if (authorization != null) {
      requestOptions.headers?.addAll(authorization);
    }

    requestOptions.headers!.addAll({
      Headers.contentLengthHeader: dataLength.toString(),
    });
    Response response = await dio.post(
      path,
      data: Stream.fromIterable(data.map((element) => [element])),
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }
}
