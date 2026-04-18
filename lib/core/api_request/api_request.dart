import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:propertify/utils/extensions/http_extension.dart';

import '../../utils/env.dart';
import '../app_cache_service.dart';
import '../failure.dart';
import '../service_locator.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

typedef ResponseParser<T> = T Function(dynamic json);

class ApiRequest {
  final Dio _dio = Dio();
  final AppCacheService _appCache;

  ApiRequest(this._appCache) {
    updateDioInterceptors();
  }

  Future<void> updateAuthorization({
    String? accessToken,
    String? uuid,
    bool clearToken = false,
  }) async {
    if (clearToken) {
      _dio.options.headers.remove('Authorization');
    } else {
      String? token = accessToken;
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  void updateDioInterceptors() {
    _dio.options = BaseOptions(
      baseUrl: env.baseUrl,
      receiveDataWhenStatusError: true,
      validateStatus: (value) {
        return value! <= 500;
      },
      headers: {'Accept': 'application/json'},
    );
    _dio
      ..interceptors.add(
        LogInterceptor(
          requestBody: kDebugMode ? true : false,
          responseBody: kDebugMode ? true : false,
          requestHeader: kDebugMode ? true : false,
        ),
      )
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) {
                final token = _appCache.getToken();
                log('AccessToken: Bearer $token');
                return handler.next(options);
              },
          onError: (DioException e, handler) {
            if (e.response?.statusCode == 402) {
              //logout user and go to login page
            }
            return handler.next(e);
          },
        ),
      );
  }

  // requests
  Future<Response> get(
    String path, {
    void Function(int, int)? onReceiveProgress,
    Options? options,
    bool considerToken = true,
    Object? data,
  }) async {
    // if (considerToken && !tokenExists) {
    //   Response dummyResponse = Response(
    //     requestOptions: RequestOptions(
    //       data: null,
    //       baseUrl: env.baseUrl,
    //       path: path,
    //     ),
    //   );
    //   return dummyResponse;
    // }
    Response firstResponse = await _dioGet(
      path,
      onReceiveProgress: onReceiveProgress,
      options: options,
    );
    if (firstResponse.statusCode == 401) {
      bool tokenStatus = await updateToken();
      if (tokenStatus) {
        Response secondResponse = await _dioGet(
          path,
          onReceiveProgress: onReceiveProgress,
          options: options,
        );
        return secondResponse;
      }
    }
    return firstResponse;
  }

  ///[delete]
  Future<Response> delete(
    String path, {
    Object? data,
    bool considerToken = true,
  }) async {
    // if (considerToken && !tokenExists) {
    //   Response dummyResponse = Response(
    //     requestOptions: RequestOptions(
    //       data: null,
    //       baseUrl: env.baseUrl,
    //       path: path,
    //     ),
    //   );
    //   return dummyResponse;
    // }
    Response firstResponse = await _dioDelete(path, data: data);
    if (firstResponse.statusCode == 401) {
      bool tokenStatus = await updateToken();
      if (tokenStatus) {
        Response secondResponse = await _dioDelete(path, data: data);
        return secondResponse;
      }
    }
    return firstResponse;
  }

  Future<Response> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    void Function(int, int)? onReceiveProgress,
  }) async {
    log('Payload received==> $data');
    Response firstResponse = await _dioPost(
      path,
      data: data,
      options: options,
      queryParameters: queryParameters,
      onReceiveProgress: onReceiveProgress,
    );
    // if (firstResponse.statusCode == 401) {
    //   bool tokenStatus = await updateToken();
    //   if (tokenStatus) {
    //     Response secondResponse = await _dioPost(
    //       path,
    //       data: data,
    //       options: options,
    //       onReceiveProgress: onReceiveProgress,
    //     );
    //     return secondResponse;
    //   }
    // }
    return firstResponse;
  }

  Future<Response> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    log('Payload received==> $data');
    Response firstResponse = await _dioPut(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    if (firstResponse.statusCode == 401) {
      bool tokenStatus = await updateToken();
      if (tokenStatus) {
        Response secondResponse = await _dioPut(path, data: data);
        return secondResponse;
      }
    }
    return firstResponse;
  }

  Future<Response> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    log('Payload received==> $data');
    Response firstResponse = await _dioPatch(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    if (firstResponse.statusCode == 401) {
      bool tokenStatus = await updateToken();
      if (tokenStatus) {
        Response secondResponse = await _dioPut(path, data: data);
        return secondResponse;
      }
    }
    return firstResponse;
  }

  Future<Response> download(
    String path,
    String filePath, {
    Object? data,
    ResponseType? responseType,
    void Function(int, int)? onReceiveProgress,
    required String method,
    bool considerToken = true,
  }) async {
    if (considerToken && !tokenExists) {
      Response dummyResponse = Response(
        requestOptions: RequestOptions(
          data: null,
          baseUrl: env.baseUrl,
          path: path,
        ),
      );
      return dummyResponse;
    }
    log('Payload received==> $data');

    Response firstResponse = await _dioDownload(
      path,
      filePath,
      data: data,
      onReceiveProgress: onReceiveProgress,
      method: method,
      responseType: responseType,
    );
    if (firstResponse.statusCode == 401) {
      bool tokenStatus = await updateToken();
      if (tokenStatus) {
        Response secondResponse = await _dioDownload(
          path,
          filePath,
          data: data,
          onReceiveProgress: onReceiveProgress,
          method: method,
          responseType: responseType,
        );
        return secondResponse;
      }
    }
    return firstResponse;
  }

  Future<Either<Failure, T>> safeGet<T>(
    String path,
    ResponseParser<T> parser, {
    Options? options,
    bool considerToken = true,
  }) async {
    if (considerToken && !tokenExists) {
      return right(parser(null));
    }
    try {
      Response httpResponse = await _dioGet(path, options: options);
      if (httpResponse.statusCode == 401) {
        bool tokenStatus = await updateToken();
        if (tokenStatus) {
          httpResponse = await _dioGet(path, options: options);
        }
      }
      final res = await httpResponse.getResponse();
      return res.fold((l) => left(l), (r) => right(parser(r)));
    } catch (e, st) {
      log(e.toString(), error: e, stackTrace: st);
      return left(const ApiFailure('Request failed'));
    }
  }

  Future<Either<Failure, T>> safePost<T>(
    String path,
    ResponseParser<T> parser, {
    Object? data,
    Options? options,
    bool considerToken = true,
  }) async {
    if (considerToken && !tokenExists) {
      return right(parser(null));
    }
    try {
      Response httpResponse = await _dioPost(
        path,
        data: data,
        options: options,
      );
      if (httpResponse.statusCode == 401) {
        bool tokenStatus = await updateToken();
        if (tokenStatus) {
          httpResponse = await _dioPost(path, options: options);
        }
      }
      final res = await httpResponse.getResponse();
      return res.fold((l) => left(l), (r) => right(parser(r)));
    } catch (e, st) {
      print(e);
      print(st);
      return left(const ApiFailure('Request failed'));
    }
  }

  Future<Either<Failure, T>> safePut<T>(
    String path,
    ResponseParser<T> parser, {
    Object? data,
    Options? options,
    bool considerToken = true,
  }) async {
    if (considerToken && !tokenExists) {
      return right(parser(null));
    }
    try {
      Response httpResponse = await _dioPut(path, data: data);
      if (httpResponse.statusCode == 401) {
        bool tokenStatus = await updateToken();
        if (tokenStatus) {
          httpResponse = await _dioPut(path, data: data);
        }
      }
      final res = await httpResponse.getResponse();
      return res.fold((l) => left(l), (r) {
        return right(parser(r));
      });
    } catch (e) {
      return left(const ApiFailure('Request failed'));
    }
  }

  // requests
  Future<Response> _dioGet(
    String path, {
    void Function(int, int)? onReceiveProgress,
    Options? options,
  }) async {
    return await _dio.get(
      path,
      onReceiveProgress: onReceiveProgress,
      options: options,
    );
  }

  ///[delete]
  // Future<Response> _dioDelete(String path) async {
  //   return await _dio.delete(path);
  // }
  Future<Response> _dioDelete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    log('_dioPost Payload received==> $data');
    return await _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response> _dioPost(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    void Function(int, int)? onReceiveProgress,
  }) async {
    log('_dioPost Payload received==> $data');
    return await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response> _dioPut(
    String path, {
    Object? data,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    log('_dioPut Payload received==> $data');
    return await _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response> _dioPatch(
    String path, {
    Object? data,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    log('_dioPatch Payload received==> $data');
    return await _dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response> _dioDownload(
    String path,
    String filePath, {
    Object? data,
    ResponseType? responseType,
    void Function(int, int)? onReceiveProgress,
    required String method,
  }) async {
    return await _dio.download(
      path,
      filePath,
      data: data,
      onReceiveProgress: onReceiveProgress,
      options: Options(method: method, responseType: responseType),
    );
  }

  bool get tokenExists {
    String? existingToken = _appCache.getToken();
    return existingToken != null;
  }

  Future clearTokenHeader() async {
    _dio.options;
  }

  Future updateToken() async {}
}
