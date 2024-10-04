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
import 'package:madathil/model/model_class/api_response_model/create_check_out_response_model.dart';
import 'package:madathil/model/model_class/api_response_model/create_customer_response.dart';
import 'package:madathil/model/model_class/api_response_model/customer_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/general_response.dart';
import 'package:madathil/model/model_class/api_response_model/get__payment_method.dart';
import 'package:madathil/model/model_class/api_response_model/get_customer_address_response.dart';
import 'package:madathil/model/model_class/api_response_model/get_customer_detail_response.dart';
import 'package:madathil/model/model_class/api_response_model/get_order_response.dart';
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
    return _apiViewModel!.get<CheckInCheckOutListResponse>(
        apiUrl:
            '${ApiUrls.kCheckinCheckoutList}&filters={"employee": "$employeeId", "date": "${DateFormat('yyyy-MM-dd').format(DateTime.now())}"}&order_by=modified desc');
  }

  Future<AttendanceList?> getAttendanceList(int page,
      {String? fromdate, String? todate}) async {
    return _apiViewModel!.get<AttendanceList>(
        apiUrl: (fromdate ?? "").isNotEmpty && (todate ?? "").isNotEmpty
            ? '${ApiUrls.kAttendanceHistory}&filters={"employee": "$employeeId", "attendance_date": ["between", ["$fromdate", "$todate"]]}&order_by=attendance_date desc&limit=10&limit_start=${page * 10}'
            : '${ApiUrls.kAttendanceHistory}&filters={"employee": "$employeeId"}&order_by=attendance_date desc&limit=10&limit_start=${page * 10}');
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
    return _apiViewModel!.get<LeadsListOwnResponse>(
        apiUrl: fromdate != null && todate != null
            ? (searchTerm ?? "").isNotEmpty
                ? '${ApiUrls.kleadListOwn}&filters={"lead_owner": "$username", "date": ["between", ["$fromdate", "$todate"]]}&limit=10&limit_start=${page * 10}&filters={"lead_name": ["like", "%$searchTerm%"]}'
                : '${ApiUrls.kleadListOwn}&filters={"lead_owner": "$username", "date": ["between", ["$fromdate", "$todate"]]}&limit=10&limit_start=${page * 10}'
            : (searchTerm ?? "").isNotEmpty
                ? '${ApiUrls.kleadListOwn}&filters={"lead_owner": "$username"}&limit=10&limit_start=${page * 10}&filters={"lead_name": ["like", "%$searchTerm%"]}'
                : '${ApiUrls.kleadListOwn}&filters={"lead_owner": "$username"}&limit=10&limit_start=${page * 10}');
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
      {String? fromdate, String? todate, String? status, String? searchTerm}) {
    String baseUrl =
        '${ApiUrls.ktaskListOthers}&filters={"assigned_user": "maya@gmail.com"';
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
  // Future<TasksListOthersResponse?> getTaskListOthers(int page,
  //     {String? fromdate, String? todate, String? status, String? searchTerm}) {
  //   return _apiViewModel!.get<TasksListOthersResponse>(
  //       apiUrl: fromdate != null && todate != null
  //           ? (status ?? "").isNotEmpty
  //               ? (searchTerm ?? "").isNotEmpty
  //                   ? '${ApiUrls.ktaskListOthers}&filters={"assigned_user":"maya@gmail.com", "subject": ["like", "%$searchTerm%"], "status":"$status", "exp_end_date": ["between", ["${((fromdate))}", "${((todate))}"]]}&limit=10&limit_start=${page * 10}'
  //                   : '${ApiUrls.ktaskListOthers}&filters={"assigned_user":"maya@gmail.com", "customer": ["like", "Mr%"], "status":"$status", "exp_end_date": ["between", ["${((fromdate))}", "${((todate))}"]]}&limit=10&limit_start=${page * 10}'
  //               : (searchTerm ?? "").isNotEmpty
  //                   ? '${ApiUrls.ktaskListOthers}&filters={"assigned_user":"maya@gmail.com", "subject": ["like", "%$searchTerm%"], "exp_end_date": ["between", ["${((fromdate))}", "${((todate))}"]]}&limit=10&limit_start=${page * 10}'
  //                   : '${ApiUrls.ktaskListOthers}&filters={"assigned_user":"maya@gmail.com", "customer": ["like", "Mr%"], "exp_end_date": ["between", ["${((fromdate))}", "${((todate))}"]]}&limit=10&limit_start=${page * 10}'
  //           : (status ?? "").isNotEmpty
  //               ? (searchTerm ?? "").isNotEmpty
  //                   ? '${ApiUrls.ktaskListOthers}&filters={"assigned_user": "maya@gmail.com", "subject": ["like", "%$searchTerm%"], "status":"$status"}&limit=10&limit_start=${page * 10}'
  //                   : '${ApiUrls.ktaskListOthers}&filters={"assigned_user": "maya@gmail.com", "status":"$status"}&limit=10&limit_start=${page * 10}'
  //               : (searchTerm ?? "").isNotEmpty
  //                   ? '${ApiUrls.ktaskListOthers}&filters={"assigned_user": "maya@gmail.com", "subject": ["like", "%$searchTerm%"]}&limit=10&limit_start=${page * 10}'
  //                   : '${ApiUrls.ktaskListOthers}&filters={"assigned_user": "maya@gmail.com"}&limit=10&limit_start=${page * 10}');
  // }

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

  Future addCall({Map<String, dynamic>? data}) async {
    return _apiViewModel!.post(apiUrl: ApiUrls.kAddCall, data: data);
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

  Future<GeneralResponse?> createPayment({Map<String, dynamic>? data}) async {
    return _apiViewModel!
        .get<GeneralResponse>(apiUrl: ApiUrls.kCreatePayment, params: data);
  }

  Future<GetPaymentMethod?> getPaymentMethod(
      {Map<String, dynamic>? data}) async {
    return _apiViewModel!
        .get<GetPaymentMethod>(apiUrl: ApiUrls.kPaymentMethod, params: data);
  }

  Future<HomeDetailResponse?> getHomeDetails() async {
    return _apiViewModel!.get<HomeDetailResponse>(
        apiUrl: '${ApiUrls.kHomeDataUrl}?user=$username');
  }
}
