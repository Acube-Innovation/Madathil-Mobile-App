// ignore_for_file: type_literal_in_constant_pattern

import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:madathil/constants.dart';
import 'package:madathil/model/model_class/api_response_model/general_response.dart';
import 'package:madathil/model/model_class/api_response_model/login_response.dart';
import 'package:madathil/model/model_class/local/environment.dart';
import 'package:madathil/model/services/api_service/api_urls.dart';
import 'package:madathil/model/services/local_db/hive_constants.dart';

class ApiViewModel {
  Dio dio = Dio();
  String pro = '0.0';

  ApiViewModel(String? env) {
    String? token = hiveInstance?.getData(DataBoxKey.kFcmToken) ?? "";

    String baseUrl;

    switch (env) {
      case Environment.dev:
        baseUrl = ApiUrls.kStagingBaseURL;
        break;
      case Environment.prod:
        baseUrl = ApiUrls.kProdBaseURL;
        break;
      default:
        baseUrl = ApiUrls.kProdBaseURL;
    }

    dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(seconds: 6)
      ..options.receiveTimeout = const Duration(seconds: 6)
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': token,
        'lang': 'en',
      }
      ..interceptors.add(
          LogInterceptor(responseBody: true, requestBody: true, request: true))
      ..interceptors.add(InterceptorsWrapper(
        onError: (error, handler) {},
        onResponse: (response, handler) {},
      ));
  }

  Future<T?> post<T>(
      {required String apiUrl, Map<String, dynamic>? data}) async {
    try {
      Response response = await dio.post(apiUrl,
          data: data,
          options: Options(headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'authorization': hiveInstance?.getData(DataBoxKey.kFcmToken),
            'lang': 'en',
          }));
      if (response.statusCode == 200) {
        return fromJson<T>(response.data);
      } else {
        throw Failure.fromCode(response.statusCode ?? ResponseCode.DEFAULT);
      }
    } on DioException catch (error) {
      throw Failure.fromCode(
          error.response?.statusCode ?? ResponseCode.DEFAULT);
    }
  }

  Future<T?> get<T>(
      {required String apiUrl, Map<String, dynamic>? data}) async {
    try {
      Response response = await dio.get(apiUrl,
          queryParameters: data,
          options: Options(headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'authorization': hiveInstance?.getData(DataBoxKey.kFcmToken),
            'lang': 'en',
          }));
      if (response.statusCode == 200) {
        return fromJson<T>(response.data);
      } else {
        // if (response.statusCode == 401) {
        //   hiveInstance?.deleteData(DataBoxKey.kFcmToken);
        //   redirect.Get.to(const LoginScreen());
        // } else
        {
          throw Failure.fromCode(response.statusCode ?? ResponseCode.DEFAULT);
        }
      }
    } on DioException catch (error) {
      throw Failure.fromCode(
          error.response?.statusCode ?? ResponseCode.DEFAULT);
    }
  }

  Future<T?> put<T>(
      {required String apiUrl, Map<String, dynamic>? data}) async {
    try {
      Response response = await dio.put(apiUrl,
          data: data,
          options: Options(headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'authorization': hiveInstance?.getData(DataBoxKey.kFcmToken),
            'lang': 'en',
          }));
      if (response.statusCode == 200) {
        return fromJson<T>(response.data);
      } else {
        throw Failure.fromCode(response.statusCode ?? ResponseCode.DEFAULT);
      }
    } on DioException catch (error) {
      throw Failure.fromCode(
          error.response?.statusCode ?? ResponseCode.DEFAULT);
    }
  }

  Future<T?> delete<T>(
      {required String apiUrl, Map<String, dynamic>? data}) async {
    try {
      Response response = await dio.delete(apiUrl,
          data: data,
          options: Options(headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'authorization': hiveInstance?.getData(DataBoxKey.kFcmToken),
            'lang': 'en',
          }));
      if (response.statusCode == 200) {
        return fromJson<T>(response.data);
      } else {
        throw Failure.fromCode(response.statusCode ?? ResponseCode.DEFAULT);
      }
    } on DioException catch (error) {
      throw Failure.fromCode(
          error.response?.statusCode ?? ResponseCode.DEFAULT);
    }
  }

  Future<T?> postFormdata<T>({required String apiUrl, required data}) async {
    String? token = hiveInstance?.getData(DataBoxKey.kFcmToken) ?? "";
    try {
      Response response = await dio.post(
        apiUrl,
        data: data,
        options: Options(headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': token,
          'lang': 'en'
        }),
        onSendProgress: (sent, total) {
          String percentage = (sent / total * 100).toStringAsFixed(2);
          pro = percentage;
        },
      );
      if (response.statusCode == 200) {
        return fromJson<T>(response.data);
      } else {
        throw Failure.fromCode(response.statusCode ?? ResponseCode.DEFAULT);
      }
    } on DioException catch (error) {
      throw Failure.fromCode(
          error.response?.statusCode ?? ResponseCode.DEFAULT);
    }
  }

  T fromJson<T>(Map<String, dynamic> json) {
    debugPrint(jsonEncode(json));
    switch (T) {
      //add api response classes here as new case.
      case GeneralResponse:
        return GeneralResponse.fromJson(json) as T;
      case LoginResponse:
        return LoginResponse.fromJson(json) as T;

      default:
        throw FromJsonNotImplementedException();
    }
  }
}

class FromJsonNotImplementedException implements Exception {
  @override
  String toString() {
    return 'FromJsonNotImplementedException: From Json Not Implemented. '
        'Possible Fixes: \n '
        '1. Check if Model class matches with API response \n '
        '2. Check if the response model class is added in the switch case in api_viewmodel.dart (line: 176)';
  }
}

class Failure {
  final String message;
  Failure(this.message);

  @override
  String toString() => message;

  factory Failure.fromCode(int code) {
    if (code == ResponseCode.DEFAULT) {
      debugPrint("status code error: ");
    }
    switch (code) {
      case ResponseCode.SUCCESS:
        return Failure("Success");
      case ResponseCode.NO_CONTENT:
        return Failure("Success with no content");
      case ResponseCode.BAD_REQUEST:
        return Failure("Bad request");
      case ResponseCode.UNAUTORISED:
        return Failure("Unauthorised");
      case ResponseCode.FORBIDDEN:
        return Failure("Forbidden");
      case ResponseCode.NOT_FOUND:
        return Failure("Not found");
      case ResponseCode.INTERNAL_SERVER_ERROR:
        return Failure("Internal server error");
      case ResponseCode.CONNECT_TIMEOUT:
        return Failure("Connection timeout");
      case ResponseCode.CANCEL:
        return Failure("Request cancelled");
      case ResponseCode.RECIEVE_TIMEOUT:
        return Failure("Receive timeout");
      case ResponseCode.SEND_TIMEOUT:
        return Failure("Send timeout");
      case ResponseCode.CACHE_ERROR:
        return Failure("Cache error");
      case ResponseCode.NO_INTERNET_CONNECTION:
        return Failure("No internet connection");
      default:
        return Failure("Something went wrong, Please try again");
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

// Example usage in an API exception handling scenario:
void handleApiException(int statusCode) {
  final failure = Failure.fromCode(statusCode);
  print(
      failure); // This will print the appropriate error message based on the status code
}
