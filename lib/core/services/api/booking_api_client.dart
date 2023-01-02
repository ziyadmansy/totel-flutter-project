import 'dart:async';
import 'dart:math';

import 'package:cheffy/Utils/Utils.dart';
import 'package:cheffy/Utils/constants.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/modules/auth/auth/domain/repositories/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';
import 'package:fresh_dio/fresh_dio.dart';

import '../../../app/app.dart';
import '../../../app/constants/error_messages.dart';

class BookingApiClient {
  // ignore: constant_identifier_names
  static const String TAG = 'BookingApiClient';

  late final Dio _dio;
  late final Fresh<OAuth2Token> _fresh;

  Fresh<OAuth2Token> get fresh => _fresh;

  BookingApiClient() {
    _dio = Dio(BaseOptions(
      baseUrl: Application.baseUrlBooking,
      responseType: ResponseType.json,
      connectTimeout: 1000 * 60,
      receiveTimeout: 1000 * 30,
      sendTimeout: 1000 * 45,
    ));
    _setupLoggingInterceptor();
  }

  static var _refreshCount = 0;

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
              errorDescription =
                  error.response?.data ?? ErrorMessages.somethingWentWrong;
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
              errorDescription =
                  '${error.response?.data ?? ErrorMessages.somethingWentWrong}\nStatus Code: ${error.response?.statusCode}';
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

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            if (headers != null) ...headers,
            ...hotelsHeaders,
          },
        ),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on DioError catch (e) {
      if (e.response?.statusCode == UniversalVariables.kUnauthenticatedCode) {
        final AuthRepo authRepo = locator.get();
        await authRepo.logout();
      }
      rethrow;
    }
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            if (headers != null) ...headers,
            ...hotelsHeaders,
          },
        ),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on DioError catch (e) {
      if (e.response?.statusCode == UniversalVariables.kUnauthenticatedCode) {
        final AuthRepo authRepo = locator.get();
        await authRepo.logout();
      }
      rethrow;
    }
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            if (headers != null) ...headers,
            ...hotelsHeaders,
          },
        ),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on DioError catch (e) {
      if (e.response?.statusCode == UniversalVariables.kUnauthenticatedCode) {
        final AuthRepo authRepo = locator.get();
        await authRepo.logout();
      }
      rethrow;
    }
  }

  Future<Response> delete(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            if (headers != null) ...headers,
            ...hotelsHeaders,
          },
        ),
        cancelToken: cancelToken,
      );

      return response;
    } on DioError catch (e) {
      if (e.response?.statusCode == UniversalVariables.kUnauthenticatedCode) {
        final AuthRepo authRepo = locator.get();
        await authRepo.logout();
      }
      rethrow;
    }
  }
}
