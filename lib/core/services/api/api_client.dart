import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:cheffy/generated/json/base/json_convert_content.dart';

import '../../../app/app.dart';
import '../../../app/constants/error_messages.dart';
import '../../models/response/base_entity.dart';

class ApiClient {
  // ignore: constant_identifier_names
  static const String TAG = 'ApiClient';

  late final Dio _dio;
  late final Fresh<OAuth2Token> _fresh;

  Fresh<OAuth2Token> get fresh => _fresh;

  ApiClient() {
    _dio = Dio(BaseOptions(
      baseUrl: Application.baseUrl,
      responseType: ResponseType.json,
      connectTimeout: 1000 * 60,
      receiveTimeout: 1000 * 30,
      sendTimeout: 1000 * 45,
    ));
    _setupAuthInterceptor();
    _setupLoggingInterceptor();
  }

  static var _refreshCount = 0;

  void _setupAuthInterceptor() {
    _fresh = Fresh.oAuth2(
      tokenStorage: InMemoryTokenStorage<OAuth2Token>(),
      refreshToken: (token, client) async {
        // print('refreshing token...');
        await Future<void>.delayed(const Duration(seconds: 1));
        if (Random().nextInt(3) == 0) {
          // print('token revoked!');
          throw RevokeTokenException();
        }
        // print('token refreshed!');
        _refreshCount++;
        return OAuth2Token(
          accessToken: 'access_token_$_refreshCount',
          refreshToken: 'refresh_token_$_refreshCount',
        );
      },
      shouldRefresh: (Response? response) {
        //todo handle 401 error
        return false;
      },
    );
    _dio.interceptors.add(_fresh);
  }

  void _setupLoggingInterceptor() {
    _dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      logPrint: (val) => Log.d(TAG, val as String),
    ));
  }

  dynamic _handleError(DioError error) {
    Log.w(TAG, error.toString(), references: ['_handleError']);

    String errorDescription = "";
    switch (error.type) {
      case DioErrorType.cancel:
        errorDescription = ErrorMessages.requestToServerWasCancelled;
        break;
      case DioErrorType.connectTimeout:
        errorDescription = ErrorMessages.connectionTimeoutServer;
        break;
      case DioErrorType.other:
        errorDescription = ErrorMessages.connectivityIssueTryAgain;
        break;
      case DioErrorType.sendTimeout:
        errorDescription = ErrorMessages.sendTimeoutServer;
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = ErrorMessages.receiveTimeoutServer;
        break;
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case 400:
          case 403:
            try {
              var r = json.encode(error.response?.data);
              errorDescription = BaseEntity.fromJson(json.decode(r)).message ??
                  ErrorMessages.somethingWentWrong;
            } catch (e) {
              Log.e(TAG, '$e',
                  references: ['_handleError', 'DioErrorType.response'],
                  exception: e);
              errorDescription = ErrorMessages.somethingWentWrong;

              if (error.response?.data != null) {
                errorDescription = '$errorDescription\n${error.response?.data}';
              }
            }
            break;
          case 500:
            errorDescription =
                '${ErrorMessages.serverError}\nStatus Code: ${error.response?.statusCode}';
            break;
          default:
            try {
              var r = json.encode(error.response?.data);
              errorDescription =
                  '${BaseEntity.fromJson(json.decode(r)).message ?? ErrorMessages.somethingWentWrong}\nStatus Code: ${error.response?.statusCode}';
            } catch (ignore) {
              errorDescription =
                  '${ErrorMessages.somethingWentWrong}\nStatus Code: ${error.response?.statusCode}';
            }
            break;
        }
        break;
      default:
        errorDescription = ErrorMessages.unexpectedErrorOccurred;
        break;
    }

    return errorDescription;
  }

  Future<R> get<T, R>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return getEntity<T, R>(response.data);
    } on DioError catch (e) {
      return Future<R>.error(_handleError(e));
    }
  }

  Future<R> post<T, R>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return getEntity<T, R>(response.data);
    } on DioError catch (e) {
      return Future<R>.error(_handleError(e));
    }
  }

  Future<R> put<T, R>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return getEntity<T, R>(response.data);
    } on DioError catch (e) {
      return Future<R>.error(_handleError(e));
    }
  }

  Future<R> delete<T, R>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return getEntity<T, R>(response.data);
    } on DioError catch (e) {
      return Future<R>.error(_handleError(e));
    }
  }

  dynamic getEntity<T, R>(responseBody) {
    try {
      if (R.toString().startsWith('List')) {
        return jsonConvert.convertListNotNull<T>(responseBody);
      } else {
        return jsonConvert.convert<R>(responseBody);
      }
    } on TypeError catch (_, e) {
      Log.e(TAG, '$e | $_ | ${_.stackTrace}', references: ['getEntity']);
      throw FormatException('$T Not parsable');
    }
  }
}
