import 'package:dio/dio.dart' as dio;

import 'package:madathil/model/model_class/api_response_model/add_closing_statment_response.dart';
import 'package:madathil/model/model_class/api_response_model/attendance_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/checkin_checkout_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/checkin_checkout_response.dart';
import 'package:madathil/model/model_class/api_response_model/create_address_response_model.dart';
import 'package:madathil/model/model_class/api_response_model/create_check_out_response_model.dart';
import 'package:madathil/model/model_class/api_response_model/create_customer_response.dart';
import 'package:madathil/model/model_class/api_response_model/customer_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/get_customer_address_response.dart';
import 'package:madathil/model/model_class/api_response_model/get_customer_detail_response.dart';
import 'package:madathil/model/model_class/api_response_model/image_uploade_response.dart';
import 'package:madathil/model/model_class/api_response_model/item_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/login_response.dart';
import 'package:madathil/model/model_class/api_response_model/product_detail_response.dart';
import 'package:madathil/model/model_class/api_response_model/product_list_model.dart';
import 'package:madathil/model/model_class/local/environment.dart';
import 'package:madathil/model/services/api_service/api_urls.dart';
import 'package:madathil/model/services/api_service/api_viewmodel.dart';

class ApiRepository {
  ApiViewModel? _apiViewModel;

  ApiRepository() {
    _apiViewModel = ApiViewModel(Environment.dev);
  }

  Future<LoginResponse?> login({Map<String, dynamic>? data}) async {
    return _apiViewModel!
        .login<LoginResponse>(apiUrl: ApiUrls.klogin, data: data);
  }

  Future<CheckInCheckOutResponse?> employeeCheckin(
      {Map<String, dynamic>? data}) async {
    return _apiViewModel!.post<CheckInCheckOutResponse>(
        apiUrl: ApiUrls.kCheckinCheckout, data: data);
  }

  Future<CheckInCheckOutListResponse?> employeeCheckinList() async {
    return _apiViewModel!
        .get<CheckInCheckOutListResponse>(apiUrl: ApiUrls.kCheckinCheckoutList);
  }

  Future<AttendanceList?> getAttendanceList() async {
    return _apiViewModel!
        .get<AttendanceList>(apiUrl: ApiUrls.kAttendanceHistory);
  }

  Future<AddClosingStatmentResponse?> addClosingStatment(
      {Map<String, dynamic>? data}) async {
    return _apiViewModel!.post<AddClosingStatmentResponse>(
        apiUrl: ApiUrls.kAddClosingStatment, data: data);
  }

  Future<ItemListResponse?> getItemList({Map<String, dynamic>? param}) async {
    return _apiViewModel!
        .get<ItemListResponse>(apiUrl: ApiUrls.kItemList, params: param);
  }

  Future<ProductListResponse?> getProductList(
      {Map<String, dynamic>? param}) async {
    return _apiViewModel!.get<ProductListResponse>(
        apiUrl: ApiUrls.kgetProductList, params: param);
  }

  Future<ProductDetailResponse?> getProductDetail(
      {Map<String, dynamic>? param}) async {
    return _apiViewModel!.get<ProductDetailResponse>(
        apiUrl: ApiUrls.kgetProductDetail, params: param);
  }

  Future<CustomerListResponse?> getCustomerList(
      {Map<String, dynamic>? param}) async {
    return _apiViewModel!.get<CustomerListResponse>(
        apiUrl: ApiUrls.kgetCustomerList, params: param);
  }

  Future<CreateCustomerResponse?> createCustomer(
      {Map<String, dynamic>? data}) async {
    return _apiViewModel!.post<CreateCustomerResponse>(
        apiUrl: ApiUrls.kCreateCustomer, data: data);
  }

  Future<ImageUploadeResponse?> documentUpload(
    dio.FormData data,
  ) {
    return _apiViewModel!.postFormdata<ImageUploadeResponse>(
      apiUrl: ApiUrls.kFileUploade,
      data: data,
    );
  }

  Future<CreateAddressResponse?> createAddress(
      {Map<String, dynamic>? data}) async {
    return _apiViewModel!.post<CreateAddressResponse>(
        apiUrl: ApiUrls.kCreateAddress, data: data);
  }

  Future<GetCustomerDetailResponse?> getCustomerDetails(
      {Map<String, dynamic>? data}) async {
    return _apiViewModel!.get<GetCustomerDetailResponse>(
        apiUrl: ApiUrls.kcustomer, params: data);
  }

  Future<GetCustomerAddress?> getCustomerAddress(
      {Map<String, dynamic>? data}) async {
    return _apiViewModel!.get<GetCustomerAddress>(
        apiUrl: ApiUrls.kCustomerAddress, params: data);
  }

  Future<CreateCheckOutResponse?> createCheckOut(
      {Map<String, dynamic>? data}) async {
    return _apiViewModel!.post<CreateCheckOutResponse>(
        apiUrl: ApiUrls.kCreateCheckOut, data: data);
  }
}
