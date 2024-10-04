// ignore_for_file: type_literal_in_constant_pattern

import 'dart:async';
import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:madathil/constants.dart';
import 'package:madathil/model/model_class/api_response_model/add_closing_statment_response.dart';
import 'package:madathil/model/model_class/api_response_model/add_new_service_response.dart';
import 'package:madathil/model/model_class/api_response_model/attendance_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/call_details_response.dart';
import 'package:madathil/model/model_class/api_response_model/call_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/checkin_checkout_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/checkin_checkout_response.dart';
import 'package:madathil/model/model_class/api_response_model/closing_statment_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/closingstatment_details_response.dart';
import 'package:madathil/model/model_class/api_response_model/create_address_response_model.dart';
import 'package:madathil/model/model_class/api_response_model/create_check_out_response_model.dart';
import 'package:madathil/model/model_class/api_response_model/create_customer_response.dart';
import 'package:madathil/model/model_class/api_response_model/customer_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/general_response.dart';
import 'package:madathil/model/model_class/api_response_model/get__payment_method.dart';
import 'package:madathil/model/model_class/api_response_model/get_customer_address_response.dart';
import 'package:madathil/model/model_class/api_response_model/get_customer_detail_response.dart';
import 'package:madathil/model/model_class/api_response_model/get_order_response.dart';
import 'package:madathil/model/model_class/api_response_model/get_order_status_response.dart';
import 'package:madathil/model/model_class/api_response_model/home_detail_response.dart';
import 'package:madathil/model/model_class/api_response_model/image_uploade_response.dart';
import 'package:madathil/model/model_class/api_response_model/item_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/lead_creation_response.dart';
import 'package:madathil/model/model_class/api_response_model/lead_list_own_response.dart';
import 'package:madathil/model/model_class/api_response_model/lead_source_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/leads_detail_response.dart';
import 'package:madathil/model/model_class/api_response_model/list_users_response.dart';
import 'package:madathil/model/model_class/api_response_model/login_response.dart';
import 'package:madathil/model/model_class/api_response_model/payment_details_response.dart';
import 'package:madathil/model/model_class/api_response_model/payment_history_response.dart';
import 'package:madathil/model/model_class/api_response_model/payment_modes_response.dart';
import 'package:madathil/model/model_class/api_response_model/product_detail_response.dart';
import 'package:madathil/model/model_class/api_response_model/product_list_model.dart';
import 'package:madathil/model/model_class/api_response_model/sales_order_detail_response.dart';
import 'package:madathil/model/model_class/api_response_model/sales_persons_list_response_addservice.dart';
import 'package:madathil/model/model_class/api_response_model/service_history_detailsresponse.dart';
import 'package:madathil/model/model_class/api_response_model/service_history_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/service_status_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/task_creation_response.dart';
import 'package:madathil/model/model_class/api_response_model/task_detail_response.dart';
import 'package:madathil/model/model_class/api_response_model/task_list_others_response.dart';
import 'package:madathil/model/model_class/api_response_model/task_status_response.dart';
import 'package:madathil/model/model_class/local/environment.dart';
import 'package:madathil/model/services/api_service/api_urls.dart';
import 'package:madathil/model/services/local_db/hive_constants.dart';

class ApiViewModel {
  Dio dio = Dio();
  String pro = '0.0';
  CookieJar cookieJar = CookieJar();

  ApiViewModel(String? env) {
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
      ..options.connectTimeout = const Duration(seconds: 15)
      ..options.receiveTimeout = const Duration(seconds: 15)
      ..options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      }
      ..interceptors.add(CookieManager(cookieJar))
      ..interceptors.add(
          LogInterceptor(responseBody: true, requestBody: true, request: true));
  }

  Future<T?> login<T>(
      {required String apiUrl, required Map<String, dynamic>? data}) async {
    try {
      Response response = await dio.post(apiUrl, data: data);
      if (response.headers[HttpHeaders.setCookieHeader] != null) {
        List<String>? setCookies =
            response.headers[HttpHeaders.setCookieHeader];
        if (setCookies != null) {
          for (var cookie in setCookies) {
            await cookieJar.saveFromResponse(Uri.parse(dio.options.baseUrl),
                [Cookie.fromSetCookieValue(cookie)]);
          }
        }
      }

      if (response.statusCode == 200) {
        Map<String, dynamic> cookies = {};
        final savedCookies =
            await cookieJar.loadForRequest(Uri.parse(dio.options.baseUrl));
        for (var cookie in savedCookies) {
          cookies[cookie.name] = cookie.value;
        }
        hiveInstance?.saveData(DataBoxKey.cookie, cookies);

        return fromJson<T>(response.data);
      } else {
        throw Failure.fromCode(response.statusCode ?? ResponseCode.DEFAULT);
      }
    } on DioException catch (error) {
      throw Failure.fromCode(
          error.response?.statusCode ?? ResponseCode.DEFAULT);
    }
  }

  Future<T?> post<T>(
      {required String apiUrl, Map<String, dynamic>? data}) async {
    try {
      Map<String, dynamic>? savedCookies =
          hiveInstance?.getData(DataBoxKey.cookie);
      if (savedCookies != null && savedCookies.isNotEmpty) {
        dio.options.headers[HttpHeaders.cookieHeader] =
            savedCookies.entries.map((e) => '${e.key}=${e.value}').join('; ');
      }

      Response response = await dio.post(apiUrl, data: data);

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
      {required String apiUrl, Map<String, dynamic>? params}) async {
    try {
      Map<String, dynamic>? savedCookies =
          hiveInstance?.getData(DataBoxKey.cookie);
      if (savedCookies != null && savedCookies.isNotEmpty) {
        dio.options.headers[HttpHeaders.cookieHeader] =
            savedCookies.entries.map((e) => '${e.key}=${e.value}').join('; ');
      }

      Response response = await dio.get(apiUrl, queryParameters: params);

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

  Future<T?> postFormdata<T>({
    required String apiUrl,
    required data,
  }) async {
    try {
      Map<String, dynamic>? savedCookies =
          hiveInstance?.getData(DataBoxKey.cookie);
      if (savedCookies != null && savedCookies.isNotEmpty) {
        dio.options.headers[HttpHeaders.cookieHeader] =
            savedCookies.entries.map((e) => '${e.key}=${e.value}').join('; ');
      }
      Response response = await dio.post(
        apiUrl,
        data: data,
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

  // Convert response to respective model classes
  T fromJson<T>(Map<String, dynamic> json) {
    switch (T) {
      case GeneralResponse:
        return GeneralResponse.fromJson(json) as T;
      case LoginResponse:
        return LoginResponse.fromJson(json) as T;
      case CheckInCheckOutResponse:
        return CheckInCheckOutResponse.fromJson(json) as T;
      case CheckInCheckOutListResponse:
        return CheckInCheckOutListResponse.fromJson(json) as T;
      case AttendanceList:
        return AttendanceList.fromJson(json) as T;
      case AddClosingStatmentResponse:
        return AddClosingStatmentResponse.fromJson(json) as T;
      case CustomerListResponse:
        return CustomerListResponse.fromJson(json) as T;
      case ItemListResponse:
        return ItemListResponse.fromJson(json) as T;
      case ProductListResponse:
        return ProductListResponse.fromJson(json) as T;
      case ProductDetailResponse:
        return ProductDetailResponse.fromJson(json) as T;
      case CustomerListResponse:
        return CustomerListResponse.fromJson(json) as T;
      case ClosingStatmentListResponse:
        return ClosingStatmentListResponse.fromJson(json) as T;
      case ClosingStatmentDetailsResponse:
        return ClosingStatmentDetailsResponse.fromJson(json) as T;
      case ServiceHistoryListResponse:
        return ServiceHistoryListResponse.fromJson(json) as T;
      case ServiceHistoryDetailsResponse:
        return ServiceHistoryDetailsResponse.fromJson(json) as T;
      case ServiceStatusListResponse:
        return ServiceStatusListResponse.fromJson(json) as T;
      case LeadsListOwnResponse:
        return LeadsListOwnResponse.fromJson(json) as T;
      case LeadsDetailsResponse:
        return LeadsDetailsResponse.fromJson(json) as T;
      case LeadsSourceListResponse:
        return LeadsSourceListResponse.fromJson(json) as T;
      case LeadsCreationResponse:
        return LeadsCreationResponse.fromJson(json) as T;
      case CreateCustomerResponse:
        return CreateCustomerResponse?.fromJson(json) as T;
      case ImageUploadeResponse:
        return ImageUploadeResponse?.fromJson(json) as T;
      case CreateAddressResponse:
        return CreateAddressResponse?.fromJson(json) as T;
      case GetCustomerDetailResponse:
        return GetCustomerDetailResponse?.fromJson(json) as T;
      case GetCustomerAddress:
        return GetCustomerAddress?.fromJson(json) as T;
      case CreateCheckOutResponse:
        return CreateCheckOutResponse?.fromJson(json) as T;
      case PaymentHistoryListResponse:
        return PaymentHistoryListResponse?.fromJson(json) as T;
      case PaymentDetailsResponse:
        return PaymentDetailsResponse?.fromJson(json) as T;
      case PaymentModesModel:
        return PaymentModesModel?.fromJson(json) as T;

      case TasksListOthersResponse:
        return TasksListOthersResponse?.fromJson(json) as T;
      case TasksDetailsResponse:
        return TasksDetailsResponse?.fromJson(json) as T;
      case TasksCreationResponse:
        return TasksCreationResponse?.fromJson(json) as T;
      case TaskStatusListResponse:
        return TaskStatusListResponse?.fromJson(json) as T;
      case GetOrdersResponse:
        return GetOrdersResponse?.fromJson(json) as T;

      case GetPaymentMethod:
        return GetPaymentMethod?.fromJson(json) as T;
      case SalesPersonsListResponse:
        return SalesPersonsListResponse?.fromJson(json) as T;
      case AddNewServiceResponse:
        return AddNewServiceResponse?.fromJson(json) as T;
      case ListUsersResponse:
        return ListUsersResponse?.fromJson(json) as T;

      case CallListResponseModel:
        return CallListResponseModel?.fromJson(json) as T;
      case CallDetailsResponseModel:
        return CallDetailsResponseModel?.fromJson(json) as T;
      case GetOrderStatusResponse:
        return GetOrderStatusResponse?.fromJson(json) as T;
      case SalesOrderDetailResponse:
        return SalesOrderDetailResponse?.fromJson(json) as T;

      case HomeDetailResponse:
        return HomeDetailResponse?.fromJson(json) as T;

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
        '2. Check if the response model class is added in the switch case in api_viewmodel.dart (line: 140)';
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
