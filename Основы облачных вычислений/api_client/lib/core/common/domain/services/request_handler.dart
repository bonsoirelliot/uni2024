import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as pp;

class RequestHandler {
  static final RequestHandler _singleton = RequestHandler._init();

  CookieManager? _cookieManager;
  late Dio? _dio;

  factory RequestHandler() {
    final handler = _singleton;
    // _userWM ??= userWM;

    return handler;
  }

  RequestHandler._init() {
    _dio = _createDio();
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    //! debugPrint('userToken1: ${UserRepository.currentUser?.token}');

    late Response<T> res;

    try {
      res = await _dio!.get(
        path,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        // options: await _getOptions(options),
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      final result = e.response;
      debugPrint('statusCode get ($path): ${result?.statusCode}');
      rethrow;
    }

    res.requestOptions.headers.forEach((key, dynamic value) {
      debugPrint('КУКИ: $key = $value');
    });

    // _checkAccess(res);

    return res;
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    //debugPrint(UserRepository.currentUser?.token);

    late Response<T> res;

    try {
      res = await _dio!.post(
        path,
        data: data,
        queryParameters: queryParameters,
        // options: await _getOptions(options),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      final result = e.response;
      debugPrint('statusCode post ($path): ${result?.statusCode}');
      rethrow;
    }
    // _checkAccess(res);

    return res;
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    late Response<T> res;
    try {
      res = await _dio!.put(
        path,
        data: data,
        queryParameters: queryParameters,
        // options: await _getOptions(options),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      final result = e.response;
      debugPrint('statusCode put ($path): ${result?.statusCode}');
      rethrow;
    }

    return res;
  }

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    // void Function(int, int)? onSendProgress,
    // void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      return _dio!.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        // options: await _getOptions(options),
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      final result = e.response;

      debugPrint('statusCode delete ($path): ${result?.statusCode}');

      // if ((result?.statusCode == 401 || result?.statusCode == 403) &&
      //     globalContext != null) {
      //   Provider.of<AuthWM>(globalContext!, listen: false).logout();
      // }

      rethrow;
    }
  }

  Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://localhost:7227/api',
        connectTimeout: const Duration(milliseconds: 20000),
        receiveTimeout: const Duration(milliseconds: 40000),
        contentType: 'application/json; charset=utf-8',
      ),
    );

    // if (_cookieManager == null) {
    //   try {
    //     pp.getApplicationDocumentsDirectory().then((dir) {
    //       _cookieManager = CookieManager(
    //         PersistCookieJar(
    //           storage: FileStorage('${dir.path}/.cookie/'),
    //         ),
    //       );
    //       dio.interceptors.add(_cookieManager!);
    //     });
    //   } catch (e) {
    //     debugPrint(e.toString());
    //   }
    // }

    return dio;
  }
}
