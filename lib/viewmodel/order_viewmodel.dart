import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/model/model_class/api_response_model/get_order_response.dart';
import 'package:madathil/model/model_class/api_response_model/get_order_status_response.dart';
import 'package:madathil/model/model_class/api_response_model/sales_order_detail_response.dart';
import 'package:madathil/model/services/api_service/api_repository.dart';
import 'package:madathil/utils/util_functions.dart';
import 'package:path_provider/path_provider.dart';

class OrderViewmodel extends ChangeNotifier {
  final ApiRepository apiRepository;

  OrderViewmodel({required this.apiRepository});

  String? _errormsg;
  String? get errormsg => _errormsg;
  bool isLoading = true;
  TextEditingController dobController = TextEditingController();

  setLoader(bool value) {
    isLoading = value;
    notifyListeners();
  }

  DateTime? _start;
  DateTime? _end;

  DateTime? get start => _start;
  DateTime? get end => _end;
  String? startFormatted;
  String? endFormatted;

  void setDateRange(DateTime? start, DateTime? end) {
    _start = start;
    _end = end;
    startFormatted = DateFormat('yyyy-MM-dd').format(start!);
    endFormatted = DateFormat('yyyy-MM-dd').format(end!);
    dobController.text = "Start: $startFormatted  End: $endFormatted";

    notifyListeners();
  }

  String? selectedCustomer;
  setSelCustomer(String val) {
    selectedCustomer = val;
    notifyListeners();
  }

  /*
  *     orders api call------------------------------------------------
  * */

  List<OrderList>? orderLlist = [];
  Future<bool> getOrdersList({int? page}) async {
    try {
      setLoader(true);

      Map<String, dynamic> filters = {};

      // Only add "posting_date" filter if start and end dates are provided
      if (startFormatted != null && endFormatted != null) {
        filters["transaction_date"] = [
          "between",
          [startFormatted, endFormatted]
        ];
      }
      if (selectedCustomer != null && selectedCustomer!.isNotEmpty) {
        filters["customer_name"] = selectedCustomer;
      }
      if (selectedStatus != null && selectedStatus!.isNotEmpty) {
        filters["status"] = selectedStatus;
      }

      Map<String, dynamic> data = {
        "fields": jsonEncode([
          "name",
          "customer_name",
          "grand_total",
          "delivery_date",
          "transaction_date",
          "order_type",
          "total_qty",
          "total_taxes_and_charges",
          "billing_status",
          "delivery_status",
          "status"
        ]),
        "filters": jsonEncode(filters),
        "limit": 10,
        "limit_start": page! * 10
      };

      GetOrdersResponse? response =
          await apiRepository.getOrdersList(data: data);
      if ((response?.data ?? []).isNotEmpty) {
        orderLlist?.clear();
        orderLlist = response?.data;
        // _productListResponse = response;
        // productData = null;
        // productData = response?.message;

        log("order data ${response?.toJson()} ");
        setLoader(false);

        return true;
      } else {
        orderLlist?.clear();
        setLoader(false);
        return false;
      }
    } catch (e) {
      setLoader(false);
      _errormsg = e.toString();
      log(e.toString());
      return false;
    }
  }

  int orderListCurrentPage = 0;
  bool orderListReachLength = false;
  List<OrderList>? orderListPost = [];
  bool _paginationOrderList = false;
  bool get ispaginationOrderList => _paginationOrderList;

  fetchOrderList() async {
    if (_paginationOrderList || orderListReachLength) {
      return;
    }
    _paginationOrderList = true;

    await getOrdersList(
      page: orderListCurrentPage,
    );
    final apiResponse = orderLlist;
    if (apiResponse != null) {
      final apiPosts = apiResponse;
      if (apiPosts.length < 10) {
        orderListReachLength = true;
      }
      orderListPost?.addAll(apiPosts);
      orderListCurrentPage++;
    }
    _paginationOrderList = false;
    if ((orderListPost ?? []).isNotEmpty) {
      notifyListeners();
    }
  }

  void resetOrderPagination() {
    orderLlist?.clear();
    orderListPost?.clear();
    orderListCurrentPage = 0;
    _paginationOrderList = false;
    orderListReachLength = false;
    notifyListeners();
  }

  /*
  *     orders status api call------------------------------------------------
  * */
  String? selectedStatus;
  setSelStatus(String? val) {
    selectedStatus = val;
    notifyListeners();
  }

  List<String>? orderStatus = [];
  Future<bool> getOrderStatus() async {
    try {
      setLoader(true);

      GetOrderStatusResponse? response = await apiRepository.getOrderStatus(
          data: {"doctype": "Sales Order", "fieldname": "status"});
      if ((response?.message ?? []).isNotEmpty) {
        orderStatus = response?.message;

        log("order status ${response?.toJson()} ");
        setLoader(false);

        return true;
      } else {
        setLoader(false);
        return false;
      }
    } catch (e) {
      setLoader(false);
      _errormsg = e.toString();
      log(e.toString());
      return false;
    }
  }

  void clearDateRange() {
    _start = null;
    _end = null;
    startFormatted = null;
    endFormatted = null;
    dobController.clear();
    notifyListeners();
  }

  void clearFilter() {
    _start = null;
    _end = null;
    startFormatted = null;
    endFormatted = null;
    dobController.clear();
    selectedCustomer = null;
    selectedStatus = null;

    notifyListeners();
  }

  OrderDetail? orderDetail;
  List<Item> item = [];

  Future<bool> getOrderDetail(String? orderId) async {
    try {
      setLoader(true);
      orderDetail = null;
      item.clear();

      SalesOrderDetailResponse? response =
          await apiRepository.getOrderDetail(data: {"sales_order_id": orderId});
      if (UtilFunctions.checkAPIStatus(
          response?.message?.name?.isNotEmpty ?? false)) {
        orderDetail = response?.message;
        item = response?.message!.items ?? [];

        log("order details ${orderDetail?.toJson()} ");
        setLoader(false);

        return true;
      } else {
        setLoader(false);
        return false;
      }
    } catch (e) {
      setLoader(false);
      _errormsg = e.toString();
      log(e.toString());
      return false;
    }
  }

  File? _file;
  File? get file => _file;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> getInvoice(String? orderID) async {
    setLoader(true);
    try {
      http.Response res = await apiRepository.getInvoice(orderID);
      dynamic getInvoiceData = res.bodyBytes;
      if (getInvoiceData != null) {
        final Directory? appDir = Platform.isAndroid
            ? await getExternalStorageDirectory()
            : await getApplicationDocumentsDirectory();
        // await getExternalStorageDirectory();

        String tempPath = appDir!.path;
        final String fileName = '$orderID.pdf';
        log(fileName);
        File file = File('$tempPath/$fileName');
        if (!await file.exists()) {
          await file.create();
        }
        await file.writeAsBytes(getInvoiceData);
        _file = file;
        log("after api call--->${file.path.toString()}");
        setLoader(false);
        notifyListeners();
        return true;
      }
      setLoader(false);
      return false;
    } catch (e) {
      _errorMessage = e.toString();
      print("exception: ${e.toString()}");
      notifyListeners();
      return false;
    }
  }
}
