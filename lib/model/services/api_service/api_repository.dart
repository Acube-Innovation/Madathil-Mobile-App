import 'dart:developer';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:dio/dio.dart' as dio;
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
import 'package:madathil/model/model_class/api_response_model/create_call_response.dart';
import 'package:madathil/model/model_class/api_response_model/create_check_out_response_model.dart';
import 'package:madathil/model/model_class/api_response_model/create_customer_response.dart';
import 'package:madathil/model/model_class/api_response_model/create_payment_response.dart';
import 'package:madathil/model/model_class/api_response_model/customer_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/employee_details_response.dart';
import 'package:madathil/model/model_class/api_response_model/employee_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/forgot_password_response.dart';
import 'package:madathil/model/model_class/api_response_model/general_response.dart';
import 'package:madathil/model/model_class/api_response_model/get__payment_method.dart';
import 'package:madathil/model/model_class/api_response_model/get_brand_response.dart';
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
import 'package:madathil/model/model_class/api_response_model/monthly_payment_details_response.dart';
import 'package:madathil/model/model_class/api_response_model/monthly_payments_response.dart';
import 'package:madathil/model/model_class/api_response_model/order_transaction_list.dart';
import 'package:madathil/model/model_class/api_response_model/payment_details_response.dart';
import 'package:madathil/model/model_class/api_response_model/payment_history_response.dart';
import 'package:madathil/model/model_class/api_response_model/payment_modes_response.dart';
import 'package:madathil/model/model_class/api_response_model/point_dettails_response.dart';
import 'package:madathil/model/model_class/api_response_model/points_list_model_response.dart';
import 'package:madathil/model/model_class/api_response_model/product_detail_response.dart';
import 'package:madathil/model/model_class/api_response_model/product_list_model.dart';
import 'package:madathil/model/model_class/api_response_model/profile_details_response.dart';
import 'package:madathil/model/model_class/api_response_model/sales_order_detail_response.dart';
import 'package:madathil/model/model_class/api_response_model/sales_persons_list_response_addservice.dart';
import 'package:madathil/model/model_class/api_response_model/service_history_detailsresponse.dart';
import 'package:madathil/model/model_class/api_response_model/service_history_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/service_status_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/task_creation_response.dart';
import 'package:madathil/model/model_class/api_response_model/task_detail_response.dart';
import 'package:madathil/model/model_class/api_response_model/task_list_others_response.dart';
import 'package:madathil/model/model_class/api_response_model/task_list_own_response.dart';
import 'package:madathil/model/model_class/api_response_model/task_status_response.dart';
import 'package:madathil/model/model_class/api_response_model/task_update_response.dart';
import 'package:madathil/model/model_class/local/environment.dart';
import 'package:madathil/model/services/api_service/api_urls.dart';
import 'package:madathil/model/services/api_service/api_viewmodel.dart';
import 'package:madathil/model/services/local_db/hive_constants.dart';
import 'package:http/http.dart' as http;

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
    return _apiViewModel!.get<CheckInCheckOutListResponse>(
        apiUrl:
            '${ApiUrls.kCheckinCheckoutList}&filters={"employee": "$employeeId", "date": "${DateFormat('yyyy-MM-dd').format(DateTime.now())}"}&order_by=modified desc');
  }

  Future<AttendanceList?> getAttendanceList(int page,
      {String? fromdate, String? todate, String? isOthersAttendance}) async {
    return _apiViewModel!.get<AttendanceList>(
        apiUrl: (fromdate ?? "").isNotEmpty && (todate ?? "").isNotEmpty
            ? '${ApiUrls.kAttendanceHistory}&filters={"employee": "${(isOthersAttendance ?? "").isNotEmpty ? isOthersAttendance : employeeId}", "attendance_date": ["between", ["$fromdate", "$todate"]]}&order_by=attendance_date desc&limit=10&limit_start=${page * 10}'
            : '${ApiUrls.kAttendanceHistory}&filters={"employee": "${(isOthersAttendance ?? "").isNotEmpty ? isOthersAttendance : employeeId}"}&order_by=attendance_date desc&limit=10&limit_start=${page * 10}');
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
    log(param.toString());
    return _apiViewModel!.get<CustomerListResponse>(
        apiUrl: ApiUrls.kgetCustomerList, params: param);
  }

  Future<ClosingStatmentListResponse?> getClosingStatmentList(
      {Map<String, dynamic>? param}) async {
    return _apiViewModel!.get<ClosingStatmentListResponse>(
        apiUrl: ApiUrls.kAddClosingStatment, params: param);
  }

  Future<ClosingStatmentDetailsResponse?> getClosingStatmentDetails(
      {Map<String, dynamic>? param, String? closingId}) async {
    return _apiViewModel!.get<ClosingStatmentDetailsResponse>(
        apiUrl: '${ApiUrls.kAddClosingStatment}/$closingId', params: param);
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

  Future<LeadsDetailsResponse?> getLeadsDetails(String? id) async {
    return _apiViewModel!.get<LeadsDetailsResponse>(
        apiUrl:
            '${ApiUrls.kLeadDetails}$id?fields=["name", "lead_name", "address_line1", "address_line2", "city", "state", "country", "pincode", "ld_source", "lead_category", "number_to_be_contacted", "email_id", "aadhaar_number", "consumer_number", "status", "lead_owner", "creation"]');
  }

  Future<LeadsListOwnResponse?> getLeadsListOwn(int page,
      {String? fromdate, String? todate, String? searchTerm}) {
    String url = fromdate != null && todate != null
        ? (searchTerm ?? "").isNotEmpty
            ? '${ApiUrls.kleadListOwn}&filters={"lead_owner": "$username", "lead_name": ["like", "%$searchTerm%"], "date": ["between", ["$fromdate", "$todate"]]}&limit=10&limit_start=${page * 10}'
            : '${ApiUrls.kleadListOwn}&filters={"lead_owner": "$username", "date": ["between", ["$fromdate", "$todate"]]}&limit=10&limit_start=${page * 10}'
        : (searchTerm ?? "").isNotEmpty
            ? '${ApiUrls.kleadListOwn}&filters={"lead_owner": "$username", "lead_name": ["like", "%$searchTerm%"]}&limit=10&limit_start=${page * 10}'
            : '${ApiUrls.kleadListOwn}&filters={"lead_owner": "$username"}&limit=10&limit_start=${page * 10}';
    print('url:$url');
    return _apiViewModel!.get<LeadsListOwnResponse>(apiUrl: url);
  }

  Future<LeadsListOwnResponse?> getLeadsListOther(int page, String userID,
      {String? fromdate, String? todate, String? searchTerm}) {
    return _apiViewModel!.get<LeadsListOwnResponse>(
        apiUrl: fromdate != null && todate != null
            ? (searchTerm ?? "").isNotEmpty
                ? '${ApiUrls.kleadListOwn}&filters={"lead_owner": "$userID", "lead_name": ["like", "%$searchTerm%"], "date": ["between", ["$fromdate", "$todate"]]}&limit=10&limit_start=${page * 10}'
                : '${ApiUrls.kleadListOwn}&filters={"lead_owner": "$userID", "date": ["between", ["$fromdate", "$todate"]]}&limit=10&limit_start=${page * 10}'
            : (searchTerm ?? "").isNotEmpty
                ? '${ApiUrls.kleadListOwn}&filters={"lead_owner": "$userID", "lead_name": ["like", "%$searchTerm%"]}&limit=10&limit_start=${page * 10}}'
                : '${ApiUrls.kleadListOwn}&filters={"lead_owner": "$userID"}&limit=10&limit_start=${page * 10}');
  }

  Future<LeadsSourceListResponse?> getSourceList() async {
    return _apiViewModel!
        .get<LeadsSourceListResponse>(apiUrl: ApiUrls.kLeadSourceList);
  }

  Future<LeadsSourceListResponse?> getCategoryList() async {
    return _apiViewModel!
        .get<LeadsSourceListResponse>(apiUrl: ApiUrls.kLeadCategoryList);
  }

  Future<LeadsCreationResponse?> createLead(Map<String, dynamic> data) async {
    return _apiViewModel!
        .post<LeadsCreationResponse>(apiUrl: ApiUrls.kLeadCreation, data: data);
  }

  Future<ServiceHistoryListResponse?> getServiceHistoryList(
      {Map<String, dynamic>? param}) async {
    return _apiViewModel!.get<ServiceHistoryListResponse>(
        apiUrl: ApiUrls.kServiceHistory, params: param);
  }

  Future<ServiceHistoryDetailsResponse?> getServiceHistoryDetails(
      {Map<String, dynamic>? param, String? serviceId}) async {
    return _apiViewModel!.get<ServiceHistoryDetailsResponse>(
        apiUrl: '${ApiUrls.kServiceHistory}$serviceId', params: param);
  }

  Future<ServiceStatusListResponse?> getServiceStatusList(
      {Map<String, dynamic>? param}) async {
    return _apiViewModel!.get<ServiceStatusListResponse>(
        apiUrl: ApiUrls.kServiceStatus, params: param);
  }

  Future<PaymentHistoryListResponse?> getPaymentHistoryList(
      {Map<String, dynamic>? param}) async {
    return _apiViewModel!.get<PaymentHistoryListResponse>(
        apiUrl: ApiUrls.kPaymentHistoryList, params: param);
  }

  Future<PaymentDetailsResponse?> getPaymentDetails(
      {Map<String, dynamic>? param, String? id}) async {
    return _apiViewModel!.get<PaymentDetailsResponse>(
        apiUrl: '${ApiUrls.kPaymentHistoryList}/$id', params: param);
  }

  Future<PaymentModesModel?> getPaymentModes() async {
    return _apiViewModel!.get(
        apiUrl:
            '${ApiUrls.kpaymentModeList}?fields=["name"]&filters={"enabled" : 1}&order_by=modified desc');
  }

  //tasks
  Future<TaskStatusListResponse?> getTaskStatusList() async {
    return _apiViewModel!
        .get<TaskStatusListResponse>(apiUrl: ApiUrls.ktaskStatusList);
  }

  Future<TaskUpdateResponse?> taskStatusUpdate(
      String? taskId, String? filterStatus) async {
    return _apiViewModel!.put<TaskUpdateResponse>(
        apiUrl: '${ApiUrls.ktaskStatusUpdate}$taskId',
        data: {"status": "$filterStatus"});
  }

  Future<TasksCreationResponse?> createTask(Map<String, dynamic> data) async {
    return _apiViewModel!
        .post<TasksCreationResponse>(apiUrl: ApiUrls.ktaskCreation, data: data);
  }

  Future<TasksDetailsResponse?> getTaskDetails(String? id) async {
    return _apiViewModel!.get<TasksDetailsResponse>(
        apiUrl:
            '${ApiUrls.ktaskDetail}$id?fields=["name", "lead_name", "address_line1", "address_line2", "city", "state", "country", "pincode", "ld_source", "lead_category", "number_to_be_contacted", "email_id", "aadhaar_number", "consumer_number", "status", "lead_owner", "creation"]');
  }

  Future<TasksListOthersResponse?> getTaskListOthers(int page,
      {String? fromdate,
      String? todate,
      String? status,
      String? searchTerm,
      required String? id}) {
    String baseUrl =
        '${ApiUrls.ktaskListOthers}&filters={"assigned_user": "$id"';
    List<String> filters = [];

    if (status != null && status.isNotEmpty) {
      filters.add('"status": "$status"');
    }

    if (searchTerm != null && searchTerm.isNotEmpty) {
      filters.add('"subject": ["like", "%$searchTerm%"]');
    }

    if (fromdate != null && todate != null) {
      filters.add('"exp_end_date": ["between", ["$fromdate", "$todate"]]');
    }

    String finalFilters = filters.isNotEmpty ? ', ${filters.join(", ")}' : '';
    String finalUrl =
        '$baseUrl$finalFilters}&limit=10&limit_start=${page * 10}';

    return _apiViewModel!.get<TasksListOthersResponse>(apiUrl: finalUrl);
  }

  Future<TasksListOwnResponse?> getTaskListOwn(int page,
      {String? fromdate, String? todate, String? status, String? searchTerm}) {
    String baseUrl =
        '${ApiUrls.ktaskListOthers}&filters={"assigned_user": "$username"';
    List<String> filters = [];

    if (status != null && status.isNotEmpty) {
      filters.add('"status": "$status"');
    }

    if (searchTerm != null && searchTerm.isNotEmpty) {
      filters.add('"subject": ["like", "%$searchTerm%"]');
    }

    if (fromdate != null && todate != null) {
      filters.add('"exp_end_date": ["between", ["$fromdate", "$todate"]]');
    }

    String finalFilters = filters.isNotEmpty ? ', ${filters.join(", ")}' : '';
    String finalUrl =
        '$baseUrl$finalFilters}&limit=10&limit_start=${page * 10}';

    return _apiViewModel!.get<TasksListOwnResponse>(apiUrl: finalUrl);
  }

  Future<ListUsersResponse?> getListUsers() async {
    return _apiViewModel!.get<ListUsersResponse>(apiUrl: ApiUrls.kListUsers);
  }

  Future<LeadsSourceListResponse?> getListTaskType() async {
    return _apiViewModel!
        .get<LeadsSourceListResponse>(apiUrl: ApiUrls.kListTaskType);
  }

  Future<CallListResponseModel?> getCallList(
      {Map<String, dynamic>? param}) async {
    return _apiViewModel!
        .get<CallListResponseModel>(apiUrl: ApiUrls.kCallList, params: param);
  }

  Future<CallDetailsResponseModel?> getCallDetails(
      {Map<String, dynamic>? param, String? id}) async {
    return _apiViewModel!.get<CallDetailsResponseModel>(
        apiUrl: '${ApiUrls.kCallList}/$id', params: param);
  }

  Future<Map<String, List<String>>?> getCallStatusList() async {
    return _apiViewModel!
        .get<Map<String, List<String>>>(apiUrl: ApiUrls.kCallStatusList);
  }

  Future<CreateCallResponse?> createCall({Map<String, dynamic>? data}) async {
    return _apiViewModel!
        .post<CreateCallResponse>(apiUrl: ApiUrls.kAddCall, data: data);
  }

  Future<SalesPersonsListResponse?> getSalesPersonsListService(
      {Map<String, dynamic>? param}) async {
    return _apiViewModel!.get<SalesPersonsListResponse>(
        apiUrl: ApiUrls.kSalesPersonListServic, params: param);
  }

  Future<AddNewServiceResponse?> addNewService(
      {Map<String, dynamic>? data}) async {
    return _apiViewModel!.post<AddNewServiceResponse>(
        apiUrl: ApiUrls.kAddServiceHistory, data: data);
  }

  Future<GetOrdersResponse?> getOrdersList({Map<String, dynamic>? data}) async {
    return _apiViewModel!
        .get<GetOrdersResponse>(apiUrl: ApiUrls.kGetOrders, params: data);
  }

  Future<CreatePaymentResponse?> createPayment(
      {Map<String, dynamic>? data}) async {
    return _apiViewModel!.get<CreatePaymentResponse>(
        apiUrl: ApiUrls.kCreatePayment, params: data);
  }

  Future<GetPaymentMethod?> getPaymentMethod(
      {Map<String, dynamic>? data}) async {
    return _apiViewModel!
        .get<GetPaymentMethod>(apiUrl: ApiUrls.kPaymentMethod, params: data);
  }

  Future<EmployeeListResponse?> getEmployeeList(
      {Map<String, dynamic>? param}) async {
    return _apiViewModel!.get<EmployeeListResponse>(
        apiUrl: ApiUrls.kEmployeeList, params: param);
  }

  Future<EmployeeDetailsResponse?> getEmployeeDetails(
      {Map<String, dynamic>? param, String? empId}) async {
    return _apiViewModel!.get<EmployeeDetailsResponse>(
        apiUrl: '${ApiUrls.kEmployeeDetails}$empId', params: param);
  }

  Future<ProfileDetailsResponse?> getProfileDetails(
      {Map<String, dynamic>? param}) async {
    return _apiViewModel!.get<ProfileDetailsResponse>(
        apiUrl: ApiUrls.kUserProfile, params: param);
  }

  Future<PointListResponse?> getPointList({Map<String, dynamic>? param}) async {
    return _apiViewModel!
        .get<PointListResponse>(apiUrl: ApiUrls.kPointList, params: param);
  }

  Future<PointDetailsResponse?> getPointDetails(
      {Map<String, dynamic>? param}) async {
    return _apiViewModel!.get<PointDetailsResponse>(
        apiUrl: ApiUrls.kPointDetails, params: param);
  }

  Future<GetOrderStatusResponse?> getOrderStatus(
      {Map<String, dynamic>? data}) async {
    return _apiViewModel!.get<GetOrderStatusResponse>(
        apiUrl: ApiUrls.korderStatus, params: data);
  }

  Future<SalesOrderDetailResponse?> getOrderDetail(
      {Map<String, dynamic>? data}) async {
    return _apiViewModel!.get<SalesOrderDetailResponse>(
        apiUrl: ApiUrls.korderDetails, params: data);
  }

  Future<http.Response> getInvoice(String? orderID) async {
    final url = Uri.parse(
        '${ApiUrls.kProdBaseURL}${ApiUrls.kgetInvoice}?doctype=Sales Invoice&name=$orderID');
    Map<String, dynamic>? savedCookies =
        hiveInstance?.getData(DataBoxKey.cookie);

    final Map<String, String> headers = {
      'Accept': 'application/pdf',
    };

    if (savedCookies != null && savedCookies.isNotEmpty) {
      String cookieHeader =
          savedCookies.entries.map((e) => '${e.key}=${e.value}').join('; ');
      headers[HttpHeaders.cookieHeader] = cookieHeader;
    }

    // Make the GET request
    final response = await http.get(url, headers: headers);

    // Check the status code for errors
    if (response.statusCode == 200) {
      return response;
    } else {
      log(response.body);
      throw HttpException(
          'Failed to fetch invoice. Status code: ${response.statusCode}');
    }
  }

  Future<HomeDetailResponse?> getHomeDetails() async {
    return _apiViewModel!.get<HomeDetailResponse>(
        apiUrl: '${ApiUrls.kHomeDataUrl}?user=$username');
  }

  Future<PaymentHistoryListResponse?> getOrderTransactionList(
      {Map<String, dynamic>? param}) async {
    return _apiViewModel!.get<PaymentHistoryListResponse>(
        apiUrl: ApiUrls.kOrderTransactionList, params: param);
  }

  Future<GetBrandResponse?> getBrand({Map<String, dynamic>? param}) async {
    return _apiViewModel!
        .get<GetBrandResponse>(apiUrl: ApiUrls.kbrands, params: param);
  }

  Future<ForgotPasswordResponse?> forgotPassword(
      {Map<String, dynamic>? data}) async {
    return _apiViewModel!.post<ForgotPasswordResponse>(
        apiUrl: ApiUrls.kForgotPassword, data: data);
  }

  Future<MonthlyPaymentsResponse?> getMonthlyPaymentsList(
      {Map<String, dynamic>? param}) async {
    return _apiViewModel!.get<MonthlyPaymentsResponse>(
        apiUrl: ApiUrls.kmonthlypayments, params: param);
  }

  Future<MonthlyPaymentsDetailsResponse?> getMonthlyPaymentDetails(
      {Map<String, dynamic>? param}) {
    return _apiViewModel!.get<MonthlyPaymentsDetailsResponse>(
        apiUrl: ApiUrls.kmonthlypaymentsdetails, params: param);
  }
}
