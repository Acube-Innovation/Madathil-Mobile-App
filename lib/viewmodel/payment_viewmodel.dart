import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:madathil/constants.dart';
import 'package:madathil/model/model_class/api_response_model/call_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/payment_details_response.dart';
import 'package:madathil/model/model_class/api_response_model/payment_history_response.dart';
import 'package:madathil/model/model_class/api_response_model/payment_modes_response.dart';
import 'package:madathil/model/services/api_service/api_repository.dart';
import 'package:path_provider/path_provider.dart';

class PaymentViewmodel extends ChangeNotifier {
  final ApiRepository apiRepository;

  PaymentViewmodel({required this.apiRepository});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _errormsg;
  String? get errormsg => _errormsg;

  bool isLoading = true;
  setLoader(bool value) {
    isLoading = value;
    notifyListeners();
  }

  TextEditingController searchControllerPaymentHistory =
      TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  bool filterOn = false;
  bool searching = false;

  String? paymentSearchfn;

  DateTime? _start;
  DateTime? _end;
  String? paymentMode;
  int? amount;

  DateTime? get start => _start;
  DateTime? get end => _end;
  String? startFormatted;
  String? endFormatted;

  void setDateRange(DateTime? start, DateTime? end) {
    _start = start;
    _end = end;
    startFormatted = DateFormat('yyyy-MM-dd').format(start!);
    endFormatted = DateFormat('yyyy-MM-dd').format(end!);
    dobController.text = "$startFormatted - $endFormatted";

    notifyListeners();
  }

  void setSearchValue(String val) {
    paymentSearchfn = val;
    notifyListeners();
  }

  void setSearchbool(bool value) {
    searching = value;
    notifyListeners();
  }

  clearSearchVal() {
    paymentSearchfn = null;
    searchControllerPaymentHistory.clear();
    notifyListeners();
  }

  /*
  payment history listing api call
  */

  PaymentHistoryListResponse? _paymentHistoryListResponse;
  PaymentHistoryListResponse? get paymentHistoryListResponse =>
      _paymentHistoryListResponse;
  List<PaymentHistoryList>? paymentList = [];

  List<String>? paymentModenames = [];

  Future<bool> getPaymentHistoryList({int? page}) async {
    try {
      isLoading = true;
      notifyListeners();
      Map<String, dynamic> filters = {
        "party": ["like", paymentSearchfn != null ? "%$paymentSearchfn%" : "%"],
        "owner": username
      };

      // Only add "posting_date" filter if start and end dates are provided
      if (startFormatted != null && endFormatted != null) {
        filters["posting_date"] = [
          "between",
          [startFormatted, endFormatted]
        ];
      }

      // Add "paymentMode" to the filters if it's not null
      if (paymentMode != null && paymentMode!.isNotEmpty) {
        filters["mode_of_payment"] = paymentMode;
      }

      // Add "amount" to the filters if it's not null
      if (amount != null && amount != 0) {
        filters["paid_amount"] = amount;
      }

      Map<String, dynamic>? param = {};

      // if (startFormatted != null && endFormatted != null) {
      param = {
        "fields": jsonEncode([
          "name",
          "party_name",
          "party",
          "party_type",
          "posting_date",
          "paid_amount",
          "reference_no",
          "paid_to_account_type",
          "paid_from_account_type",
          "mode_of_payment",
          "status"
        ]),
        "filters": jsonEncode(filters),
        "order_by": "modified desc",
        "limit": 10,
        "limit_start": page! * 10
      };
      // } else {
      //   param = {
      //     "fields": jsonEncode([
      //       "name",
      //       "party_name",
      //       "party",
      //       "party_type",
      //       "posting_date",
      //       "paid_amount",
      //       "reference_no",
      //       "paid_to_account_type",
      //       "paid_from_account_type",
      //       "mode_of_payment",
      //       "status"
      //     ]),
      //     "filters": jsonEncode({
      //       // "employee_id": "HR-EMP-00187",
      //       "party": [
      //         "like",
      //         paymentSearchfn != null ? "$paymentSearchfn%" : "%"
      //       ]
      //     }),
      //     "order_by": "modified desc",
      //     "limit": 10,
      //     "limit_start": page! * 10
      //   };
      // }

      PaymentHistoryListResponse? response =
          await apiRepository.getPaymentHistoryList(param: param);
      log('response ------------------------------------ ${response?.toJson()}');

      if (response?.data != null) {
        paymentList?.clear;
        paymentList = response?.data;

        log("payment List ------------ > ${paymentList?.first.toJson() ?? []}");

        isLoading = false;
        notifyListeners();

        return true;
      }

      log("Empty list");
      isLoading = false;
      notifyListeners();

      return false;
    } catch (e) {
      _errormsg = e.toString();
      print(
          'error message ---------------------------------------------- $_errormsg');
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  int paymentCurrentPage = 0;
  bool paymentReachLength = false;
  List<PaymentHistoryList>? paymentPost = [];
  PaymentModesModel? paymentModesModel;
  bool _paginationclosing = false;
  bool get ispaginationclosing => _paginationclosing;

  fetchPaymentHistoryList() async {
    if (_paginationclosing || paymentReachLength) {
      return;
    }

    _paginationclosing = true;

    await getPaymentHistoryList(page: paymentCurrentPage);
    final apiResponse = paymentList;
    print('payment list ------------------------------ $paymentList');
    print('api response ------------------------------ $apiResponse');

    if (apiResponse != null) {
      final apiPosts = apiResponse;
      if (apiPosts.length < 10) {
        paymentReachLength = true;
      }
      paymentPost?.addAll(apiPosts);
      paymentCurrentPage++;
      print('payment post ------------------------------ $paymentPost');
      print(
          'payment current page ------------------------------ $paymentCurrentPage');
    }
    _paginationclosing = false;
    if ((paymentPost ?? []).isNotEmpty) {
      notifyListeners();
    }
  }

  void resetPaymentPagination() {
    paymentList?.clear();
    paymentPost?.clear();
    paymentCurrentPage = 0;
    _paginationclosing = false;
    paymentReachLength = false;
    searching = false;
    notifyListeners();
  }

  void clearDateRange() {
    _start = null;
    _end = null;
    startFormatted = null;
    endFormatted = null;
    dobController.clear();
    notifyListeners();
  }

  void clearFilter(String filter) {
    if (filter == "payment Mode") {
      paymentMode = null;
    } else if (filter == "amount") {
      amount = null;
      amountController.clear();
    } else if (filter == 'date') {
      // _start = null;
      // _end = null;
      startFormatted = null;
      endFormatted = null;
      dobController.clear();
    } else {
      paymentMode = null;
      amount = null;
      startFormatted = null;
      endFormatted = null;
      dobController.clear();
      amountController.clear();
    }
    if (paymentMode == null &&
        amount == null &&
        startFormatted == null &&
        endFormatted == null) {
      filterOn = false;
    }
    if (filter != 'all') {
      resetPaymentPagination();
    }

    fetchPaymentHistoryList();

    notifyListeners();
  }

  /*
  * payment details api call
  * */

  PaymentDetails? paymentDetails;

  Future<bool> getPaymentDetails({String? paymentId}) async {
    try {
      Map<String, dynamic>? param = {};

      param = {
        "fields": jsonEncode([
          "party_name",
          "party",
          "party_type",
          "posting_date",
          "paid_amount",
          "reference_no",
          "paid_to_account_type",
          "paid_from_account_type",
          "mode_of_payment",
          "status"
        ]),
      };

      isLoading = true;
      notifyListeners();

      PaymentDetailsResponse? response =
          await apiRepository.getPaymentDetails(param: param, id: paymentId);

      if (response?.data != null) {
        paymentDetails = null;
        paymentDetails = response?.data;
        isLoading = false;
        notifyListeners();
        return true;
      }
      isLoading = false;
      notifyListeners();
      return false;
    } catch (e) {
      _errormsg = e.toString();
      log('error message ---------------------------------------------- $_errormsg');
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<List<String?>?> fetchPaymentModes() async {
    try {
      // Call the API to get the list of payment modes
      PaymentModesModel? paymentModesModel =
          await apiRepository.getPaymentModes();

      // Check if the response is valid and contains data
      if (paymentModesModel != null && paymentModesModel.data != null) {
        // Extract the 'name' field from each PaymentMode object
        paymentModenames =
            paymentModesModel.data!.map((mode) => mode.name ?? '').toList();
        print(
            'the list of payment modes --------------------------------------- $paymentModenames');

        // Return the list of payment mode names
        return paymentModenames;
      } else {
        // Return an empty list if no data is found
        return [];
      }
    } catch (e) {
      // Handle errors (e.g., log them or show an error message)
      print(
          'Error fetching payment modes: ------------------------------------------- $e');
      return [];
    }
  }

  /* dowbload payment receipt */

  File? _file;
  File? get file => _file;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> getPaymentReceipt(String? receiptNo) async {
   // setLoader(true);
    try {
      http.Response res = await apiRepository.getPaymentReciept(receiptNo);
      dynamic getReceptData = res.bodyBytes;
      if (getReceptData != null) {
        final Directory? appDir = Platform.isAndroid
            ? await getExternalStorageDirectory()
            : await getApplicationDocumentsDirectory();
        // await getExternalStorageDirectory();

        String tempPath = appDir!.path;
        final String fileName = '$receiptNo.pdf';
        log(fileName);
        File file = File('$tempPath/$fileName');
        if (!await file.exists()) {
          await file.create();
        }
        await file.writeAsBytes(getReceptData);
        _file = file;
        log("after api call--->${file.path.toString()}");
     //   setLoader(false);
        notifyListeners();
        return true;
      }
    //  setLoader(false);
      return false;
    } catch (e) {
      _errorMessage = e.toString();
      print("exception: ${e.toString()}");
      notifyListeners();
      return false;
    }
  }
}
