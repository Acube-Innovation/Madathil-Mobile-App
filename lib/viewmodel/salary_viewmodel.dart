import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:madathil/constants.dart';
import 'package:madathil/model/model_class/api_response_model/monthly_payment_details_response.dart';
import 'package:madathil/model/model_class/api_response_model/monthly_payments_response.dart';
import 'package:madathil/model/model_class/api_response_model/monthly_salary_details_response.dart';
import 'package:madathil/model/model_class/api_response_model/monthly_salary_list_response.dart';
import 'package:madathil/model/services/api_service/api_repository.dart';

class SalaryViewmodel extends ChangeNotifier {
  final ApiRepository apiRepository;

  SalaryViewmodel({required this.apiRepository});

  bool _isloading = false;
  bool? get isloading => _isloading;

  String? _errormsg;
  String? get errormsg => _errormsg;

  //add time
  String? _fromdate;
  String? get fromdate => _fromdate;

  String? _todate;
  String? get todate => _todate;

  addFromToTime(String fromdate, String todate) {
    _fromdate = fromdate;
    _todate = todate;
    notifyListeners();
  }

  void clearDates() {
    _fromdate = null;
    _todate = null;
    notifyListeners();
  }

  setLoader(bool value) {
    _isloading = value;
    notifyListeners();
  }

  MonthlySalaryListResponse? monthlySalaryListResponse;
  MonthlySalaryDetailsResponse? monthlySalaryDetailsResponse;

  fetchMonthlySalaryList() async {
    setLoader(true);
    try {
      MonthlySalaryListResponse? response =
          await apiRepository.getMonthlySalaryList(employeeId!);
      if (response?.message != null) {
        monthlySalaryDetailsResponse = null;
        monthlySalaryListResponse = response;
        notifyListeners();
        return true;
      }
    } catch (e) {
      print('error --------------------------- $e');
      return false;
    }
    setLoader(false);
  }

  clearSalaryList() {
    monthlySalaryListResponse = null;
  }

  fetchMonthlySalaryDetails(String? month) async {
    setLoader(true);
    try {
      MonthlySalaryDetailsResponse? response =
          await apiRepository.getMonthlySalaryDetails(employeeId!, month!);

      if (response != null) {
        monthlySalaryDetailsResponse = null;
        monthlySalaryDetailsResponse = response;
        _isloading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      print('e -------------------------------- $e');
    }
  }


  /*
  * Payment List api call
  * */

  List<MonthlySalarySummary>? monthlySalarySummary;

  Future<bool> getMonthlyPaymentsList() async {
    try {
      _isloading = true;

      notifyListeners();

      Map<String, dynamic>? param = {};

      param = {"employee_id": employeeId};

      MonthlyPaymentsResponse? response =
          await apiRepository.getMonthlyPaymentsList(param: param);

      if (response?.message != null) {
        monthlySalarySummary = response?.message?.monthlySalarySummary;

        log('response--------------$monthlySalarySummary');
        _isloading = false;
        notifyListeners();
        return true;
      }

      _isloading = false;
      notifyListeners();
      return false;
    } catch (e) {
      _errormsg = e.toString();
      _isloading = false;
      notifyListeners();
      return false;
    }
  }

  /*
  * Payment details api call
  * */

  List<Payments>? payments;

  Future<bool> getMonthlyPaymentDetails({String? month}) async {
    try {
      _isloading = true;
      notifyListeners();

      Map<String, dynamic>? param = {};

      param = {"employee_id": employeeId, "month": month};

      MonthlyPaymentsDetailsResponse? response =
          await apiRepository.getMonthlyPaymentDetails(param: param);

      payments = response?.message?.payments;

      if (response?.message != null) {
        _isloading = false;
        notifyListeners();
        return true;
      }
      _isloading = false;
      notifyListeners();
      return false;
    } catch (e) {
      _errormsg = e.toString();
      _isloading = false;
      notifyListeners();
      return false;
    }
  }

  clearmonthlySalarySummary() {
    monthlySalarySummary?.clear();
  }

  clearMonthlyPaymentsDetails() {
    payments?.clear();
  }
}
