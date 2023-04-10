import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../common/constant/alert_message.dart';
import '../../../common/constant/app_config.dart';
import '../../../common/constant/app_utils.dart';
import '../../network/result.dart';


typedef EntityMapper<Entity, Model> = Model Function(Entity entity);

abstract class _ErrorCode {
  static const message = "message";
  static const errors = "errors";
  static const unauthorized = "unauthorized";
}

abstract class BaseRepository {
  final String _apiEndpoint = AppConfig.HOST;

  Future<Map<String, String>> _getHeaders() async {
    String token = await AppUtils().getToken();
    return {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
  }

  Future<Dio> get dio => _getDio();

  Future<Dio> _getDio() async {
    final dio = Dio();
    final headers = await _getHeaders();
    dio.options = BaseOptions(
      baseUrl: _apiEndpoint,
      connectTimeout: const Duration(seconds: 300),
      receiveTimeout: const Duration(seconds: 300),
      headers: headers,
      followRedirects: true,
    );
    dio.interceptors.add(LogInterceptor(
        responseBody: !kReleaseMode,
        requestBody: !kReleaseMode,
        responseHeader: !kReleaseMode,
        requestHeader: !kReleaseMode,
        error: !kReleaseMode,
        logPrint: (object) {
          if (!kReleaseMode) {
            debugPrint(object.toString());
          }
        },
        request: !kReleaseMode));

    dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            return handler.next(options);
          },
          onResponse:(response, handler) {
            return handler.next(response);
          },
          onError: (error, handler) async {
              if (error.response?.statusCode == 401) {
              }
            return handler.next(error);
          },
        )
    );

    return dio;
  }

  Future<Result<T>> safeCall<T>(Future<T> call) async {
    try {
      var response = await call;
      return Success(response);
    } catch (exception, stackTrace) {
      if (exception is DioError) {
        switch (exception.type) {
          case DioErrorType.connectionTimeout:
          case DioErrorType.sendTimeout:
          case DioErrorType.receiveTimeout:
          case DioErrorType.cancel:
            return Error(AlertMessages.TIMEOUT_ERROR_MSG);

          case DioErrorType.unknown:
            return Error(AlertMessages.OFFLINE_ERROR_MSG);

          case DioErrorType.badResponse:
            return _getError(exception.response);

          default:
            return Error(AlertMessages.GENERIC_ERROR_MSG);
        }
      }
      return Error(AlertMessages.GENERIC_ERROR_MSG);
    }
  }

  Future<Result<T>> _getError<T>(Response? response) async {
    if (response?.data != null && response?.data is Map<String, dynamic>) {
      if ((response!.data as Map<String, dynamic>).containsKey(_ErrorCode.message)) {
        var errorMessage = response.data[_ErrorCode.message] as String;
        // if(response.data[_ErrorCode.errors] != null && (response.data[_ErrorCode.errors] as List<dynamic>) != null && (response.data[_ErrorCode.errors] as List<dynamic>).length > 0) {
        // errorMessage = (response.data[_ErrorCode.errors] as List<dynamic>)[0][_ErrorCode.message];
        // }
        // if (errorMessage.toLowerCase() == _ErrorCode.unauthorized.toLowerCase()) {
        // /// show session expired toast
        // _toastService.show(AlertMessages.SESSION_EXPIRED);
        //
        // /// logout user and navigate user to login screen
        // // await _navigationService.logout();
        //
        // /// return
        // return Error(errorMessage);
        // }
        return Error(errorMessage);
      }
    }
    return Error(
      AlertMessages.GENERIC_ERROR_MSG,
    );
  }
}
