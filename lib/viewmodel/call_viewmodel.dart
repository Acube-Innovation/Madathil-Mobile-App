import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/model/model_class/api_response_model/call_details_response.dart';
import 'package:madathil/model/model_class/api_response_model/call_list_response.dart';
import 'package:madathil/model/services/api_service/api_repository.dart';

class CallViewModel extends ChangeNotifier {
  final ApiRepository apiRepository;

  CallViewModel({required this.apiRepository});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _errormsg;
  String? get errormsg => _errormsg;

  bool isLoading = true;
  setLoader(bool value) {
    isLoading = value;
    notifyListeners();
  }

  /*
  Call list management related stuff starts from here
  */

  TextEditingController searchControllerCall = TextEditingController();
  TextEditingController dateController = TextEditingController();

  String? callSearchfn;

  DateTime? _startDateCall;
  DateTime? _endDateCall;

  DateTime? get startDateCall => _startDateCall;
  DateTime? get endDateCall => _endDateCall;
  String? startFormattedCall;
  String? endFormattedCall;

  void setCallDateRange(DateTime? start, DateTime? end) {
    _startDateCall = start;
    _endDateCall = end;
    startFormattedCall = DateFormat('yyyy-MM-dd').format(start!);
    endFormattedCall = DateFormat('yyyy-MM-dd').format(end!);
    dateController.text = "$startFormattedCall - $endFormattedCall";

    notifyListeners();
  }

  void setCallSearchValue(String val) {
    callSearchfn = val;
    notifyListeners();
  }

  clearCallSearchVal() {
    callSearchfn = null;
    searchControllerCall.clear();
    notifyListeners();
  }

  /*
  call listing api call
  */

  CallListResponseModel? _callListResponse;
  CallListResponseModel? get callListResponse => _callListResponse;
  List<CallListResponse>? callList = [];

  Future<bool> getCallList({int? page}) async {
    try {
      isLoading = true;
      notifyListeners();
      Map<String, dynamic> filters = {
        "customer": ["like", callSearchfn != null ? "$callSearchfn%" : "%"],
      };

      // Only add "posting_date" filter if start and end dates are provided
      if (startFormattedCall != null && endFormattedCall != null) {
        filters["called_date"] = [
          "between",
          [startFormattedCall, endFormattedCall]
        ];
      }

      Map<String, dynamic>? param = {};

      // if (startFormatted != null && endFormatted != null) {
      param = {
        "fields": jsonEncode([
          "name",
          "customer",
          "called_number",
          "called_date",
          "call_status",
          "conversation_duration"
        ]),
        "filters": jsonEncode(filters),
        "order_by": "modified desc",
        "limit": 10,
        "limit_start": page! * 10
      };

      CallListResponseModel? response =
          await apiRepository.getCallList(param: param);
      log('response ------------------------------------ ${response?.toJson()}');

      if (response?.data != null) {
        callList?.clear;
        callList = response?.data;

        log("call List ------------ > ${callList?.first.toJson() ?? []}");

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
          'error message ---------------------------------------------- ${_errormsg}');
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  int callCurrentPage = 0;
  bool callReachLength = false;
  List<CallListResponse>? callPost = [];
  bool _callPaginationclosing = false;
  bool get iscallPaginationclosing => _callPaginationclosing;

  fetchCallList() async {
    if (_callPaginationclosing || callReachLength) {
      return;
    }

    _callPaginationclosing = true;

    await getCallList(page: callCurrentPage);
    final apiResponse = callList;
    print('call list ------------------------------ ${callList}');
    print('api response ------------------------------ ${apiResponse}');

    if (apiResponse != null) {
      final apiPosts = apiResponse;
      if (apiPosts.length < 10) {
        callReachLength = true;
      }
      callPost?.addAll(apiPosts);
      callCurrentPage++;
      print('call post ------------------------------ ${callPost}');
      print(
          'call current page ------------------------------ ${callCurrentPage}');
    }
    _callPaginationclosing = false;
    if ((callPost ?? []).isNotEmpty) {
      notifyListeners();
    }
  }

  void resetCallPagination() {
    callList?.clear();
    callPost?.clear();
    callCurrentPage = 0;
    _callPaginationclosing = false;
    callReachLength = false;
    notifyListeners();
  }

  void clearCallDateRange() {
    _startDateCall = null;
    _endDateCall = null;
    startFormattedCall = null;
    endFormattedCall = null;
    dateController.clear();
    notifyListeners();
  }

  /*
  * call details api call
  * */

  List<TrackCalls?>? callTracking;
  CallDetails? callDetails;

  Future<bool> getCallDetails({String? callId}) async {
    try {
      Map<String, dynamic>? param = {};

      param = {
        "fields": jsonEncode([
          "customer",
          "called_number",
          "caller_number",
          "called_date",
          "call_status",
          "conversation_duration",
          "track_calls"
        ]),
      };

      isLoading = true;
      notifyListeners();

      CallDetailsResponseModel? response =
          await apiRepository.getCallDetails(param: param, id: callId);

      if (response?.data != null) {
        if (response?.data?.trackCalls != null) {
          callTracking = [];
          callTracking = response?.data?.trackCalls;
        }
        callDetails = null;
        callDetails = response?.data;
        isLoading = false;
        notifyListeners();
        return true;
      }
      isLoading = false;
      notifyListeners();
      return false;
    } catch (e) {
      _errormsg = e.toString();
      log('error message ---------------------------------------------- ${_errormsg}');
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  String formatTimeFromSeconds(double? totalSeconds) {
    int hours = (totalSeconds! ~/ 3600); // Get total hours
    int minutes = ((totalSeconds % 3600) ~/ 60); // Get remaining minutes
    int seconds = (totalSeconds % 60).toInt(); // Get remaining seconds

    String formattedTime = '';

    if (hours > 0) {
      formattedTime += '${hours}h ';
    }
    if (minutes > 0) {
      formattedTime += '${minutes}m ';
    }
    if (seconds > 0) {
      formattedTime += '${seconds}s';
    }

    return formattedTime.trim(); // Trim any extra spaces
  }
}
