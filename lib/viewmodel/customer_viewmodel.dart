import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:madathil/model/model_class/api_response_model/customer_list_response.dart';
import 'package:madathil/model/services/api_service/api_repository.dart';

class CustomerViewmodel extends ChangeNotifier {
  final ApiRepository apiRepository;

  CustomerViewmodel({required this.apiRepository});
  String? _errormsg;
  String? get errormsg => _errormsg;

  bool isLoading = true;
  setLoader(bool value) {
    isLoading = value;
    notifyListeners();
  }

  String _selectedValue = '';

  String get selectedValue => _selectedValue;

  void selectValue(String value) {
    _selectedValue = value;
    notifyListeners(); // Notify listeners when the value changes
  }

  List<Customer>? customerList = [];

  Future<bool> getCustomerList({int? page}) async {
    try {
      setLoader(true);

      CustomerListResponse? response =
          await apiRepository.getCustomerList(param: {
        "fields": jsonEncode(
            ["name", "customer_name", "image", "email_id", "mobile_no"]),
        "filters": jsonEncode({"disabled": "false"}),
        "order_by": "modified desc",
        "limit": 10,
        "limit_start": page! * 0
      });
      if ((response?.data ?? []).isNotEmpty) {
        customerList = response?.data;

        log("produtct detail------------> ${customerList?.first.toJson()}");
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

  int cstListCurrentPage = 0;
  bool cstListReachLength = false;
  List<Customer>? customerPost = [];
  bool _paginationcstList = false;
  bool get ispaginationcstList => _paginationcstList;

  fetchCustomerList({bool? isSolarProduct}) async {
    if (_paginationcstList || cstListReachLength) {
      return;
    }
    _paginationcstList = true;

    await getCustomerList(
      page: cstListCurrentPage,
    );
    final apiResponse = customerList;
    if (apiResponse != null) {
      final apiPosts = apiResponse;
      if (apiPosts.length < 10) {
        cstListReachLength = true;
      }
      customerPost?.addAll(apiPosts);
      cstListCurrentPage++;
    }
    _paginationcstList = false;
    if ((customerPost ?? []).isNotEmpty) {
      notifyListeners();
    }
  }

  void resetCustomerPagination() {
    customerList?.clear();
    customerPost?.clear();
    cstListCurrentPage = 0;
    _paginationcstList = false;
    cstListReachLength = false;
    notifyListeners();
  }
}
