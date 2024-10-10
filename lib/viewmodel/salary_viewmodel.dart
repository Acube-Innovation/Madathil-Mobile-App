import 'package:flutter/material.dart';
import 'package:madathil/model/services/api_service/api_repository.dart';

class SalaryViewmodel extends ChangeNotifier {
  final ApiRepository apiRepository;

  SalaryViewmodel({required this.apiRepository});

  final bool _isloading = false;
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

  /*
  * Salary List api call
  * */

  // clearSalaryData() {
  //   _SalaryList = null;
  //   _SalaryListData = [];
  //   notifyListeners();
  // }

  // //
  // SalaryList? _SalaryList;
  // SalaryList? get SalaryList => _SalaryList;

  // Future<bool> getSalaryList(int page,
  //     {String? fromdate, String? todate, String? isOthersSalary}) async {
  //   try {
  //     _isloading = true;
  //     SalaryList? response = await apiRepository.getSalaryList(page,
  //         fromdate: fromdate, todate: todate, isOthersSalary: isOthersSalary);
  //     if ((response?.data ?? []).isNotEmpty) {
  //       _SalaryList = response;
  //       _isloading = false;
  //       notifyListeners();
  //       return true;
  //     } else {
  //       _isloading = false;
  //       notifyListeners();
  //       return false;
  //     }
  //   } catch (e) {
  //     _isloading = false;
  //     _errormsg = e.toString();
  //     print("error: $e");
  //     return false;
  //   }
  // }

  // //Salary list pagination

  // List<SalaryListData>? _SalaryListData = [];
  // List<SalaryListData>? get SalaryListData => _SalaryListData;
  // bool _isLoadingSalaryListPagination = false;
  // bool get isLoadingSalaryListPagination => _isLoadingSalaryListPagination;
  // int _SalaryListCurrentPage = 0;
  // bool _reachedLastPageSalaryList = false;
  // bool get reachedLastPageSalaryList => _reachedLastPageSalaryList;

  // Future<void> getSalaryListOwn({String? isOthersSalary}) async {
  //   if (_isLoadingSalaryListPagination || _reachedLastPageSalaryList) {
  //     return;
  //   }
  //   _isLoadingSalaryListPagination = true;
  //   notifyListeners();
  //   await getSalaryList(_SalaryListCurrentPage,
  //       fromdate: fromdate, todate: todate, isOthersSalary: isOthersSalary);
  //   final apiResponse = SalaryList;
  //   final apiPosts = apiResponse?.data ?? [];
  //   if (apiPosts.length < 10) {
  //     _reachedLastPageSalaryList = true;
  //   }
  //   if (apiResponse != null) {
  //     if (apiPosts.isNotEmpty) {
  //       _SalaryListData?.addAll(apiPosts);
  //     }
  //     _SalaryListCurrentPage++;
  //   }
  //   _isLoadingSalaryListPagination = false;
  //   notifyListeners();
  // }

  // void resetSalaryListPagination() {
  //   _SalaryListData = [];
  //   _SalaryListCurrentPage = 0;
  //   _isLoadingSalaryListPagination = false;
  //   _reachedLastPageSalaryList = false;
  //   notifyListeners();
  // }
}
