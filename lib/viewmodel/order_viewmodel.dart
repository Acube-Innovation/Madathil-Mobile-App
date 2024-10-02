import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/model/model_class/api_response_model/get_order_response.dart';
import 'package:madathil/model/services/api_service/api_repository.dart';

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

  /*
  *     orders api call------------------------------------------------
  * */

  List<OrderList>? orderLlist = [];
  Future<bool> getOrdersList({int? page}) async {
    try {
      setLoader(true);
      Map<String, dynamic> data = {};

      data = {
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
        "limit": 10,
        "limit_start": page! * 0
      };

      GetOrdersResponse? response =
          await apiRepository.getOrdersList(data: data);
      if ((response?.data ?? []).isNotEmpty) {
        orderLlist?.clear();
        orderLlist = response?.data;
        // _productListResponse = response;
        // productData = null;
        // productData = response?.message;

        log("order data ${orderLlist?.first.customerName} ");
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
}
