import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:madathil/model/model_class/api_response_model/create_address_response_model.dart';
import 'package:madathil/model/model_class/api_response_model/image_uploade_response.dart';
import 'package:madathil/model/model_class/api_response_model/lead_creation_response.dart';
import 'package:madathil/model/model_class/api_response_model/lead_list_own_response.dart';
import 'package:madathil/model/model_class/api_response_model/lead_source_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/leads_detail_response.dart';
import 'package:madathil/model/services/api_service/api_repository.dart';

class LeadsViewmodel extends ChangeNotifier {
  final ApiRepository apiRepository;

  LeadsViewmodel({required this.apiRepository});
  String? _errormsg;
  String? get errormsg => _errormsg;

  bool isLoading = true;
  setLoader(bool value) {
    isLoading = value;
    notifyListeners();
  }

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
  * get lead details api call
  * */

  LeadsDetailsResponse? _leadsDetails;
  LeadsDetailsResponse? get leadsDetails => _leadsDetails;

  Future<bool> getLeadsDetails({String? id}) async {
    try {
      LeadsDetailsResponse? leadsDetailsResponse =
          await apiRepository.getLeadsDetails(id);
      if ((leadsDetailsResponse?.data) != null) {
        _leadsDetails = leadsDetailsResponse;
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      _errormsg = e.toString();
      if (kDebugMode) {
        print("error: ${e.toString()}");
      }
      notifyListeners();

      return false;
    }
  }

  /*
  * get lead Source details api call
  * */

  List<String>? _leadsSourceDetails;
  List<String>? get leadsSourceDetails => _leadsSourceDetails;

  Future<bool> getLeadsSourceList() async {
    try {
      LeadsSourceListResponse? leadsSourceDetailsResponse =
          await apiRepository.getSourceList();
      if (leadsSourceDetailsResponse != null &&
          leadsSourceDetailsResponse.data != null) {
        _leadsSourceDetails = leadsSourceDetailsResponse.data
            ?.map((item) => item.name ?? '')
            .toList();
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      _errormsg = e.toString();
      if (kDebugMode) {
        print("error: ${e.toString()}");
      }
      notifyListeners();

      return false;
    }
  }

  /*
  * get lead category details api call
  * */

  List<String>? _leadsCategoryDetails = [];
  List<String>? get leadsCategoryDetails => _leadsCategoryDetails;

  Future<bool> getLeadsCategoryDetails() async {
    try {
      LeadsSourceListResponse? leadsCategoryDetailsResponse =
          await apiRepository.getCategoryList();
      if (leadsCategoryDetailsResponse != null &&
          leadsCategoryDetailsResponse.data != null) {
        _leadsCategoryDetails = leadsCategoryDetailsResponse.data
            ?.map((item) => item.name ?? '')
            .toList();
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      _errormsg = e.toString();
      if (kDebugMode) {
        print("error: ${e.toString()}");
      }
      notifyListeners();

      return false;
    }
  }

  /*
  * leads creation api call
  * */

  /*
  * file uploade api call
  * */

  Future<ImageUploadeResponse?> uploadDocument(
    File file,
  ) async {
    var data = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      ),
    });

    return await apiRepository.documentUpload(data);
  }

  String? _leadCreationImage;
  String? get leadCreationImage => _leadCreationImage;

  addImage(String? val) {
    _leadCreationImage = val;
    notifyListeners();
  }

  String? _leadCreationDetails;
  String? get leadCreationDetails => _leadCreationDetails;

  Future<bool> createLead(Map<String, dynamic> data) async {
    try {
      LeadsCreationResponse? leadsCreationResponse =
          await apiRepository.createLead(data);
      if ((leadsCreationResponse?.data) != null) {
        _leadCreationDetails = leadsCreationResponse?.data?.name ?? "";
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      _errormsg = e.toString();
      if (kDebugMode) {
        print("error: ${e.toString()}");
      }
      notifyListeners();

      return false;
    }
  }

  /*
  * leads address creation api call
  * */

  Future<bool> createLeadAddress(Map<String, dynamic> data) async {
    try {
      CreateAddressResponse? leadsCategoryDetailsResponse =
          await apiRepository.createAddress(data: data);
      if ((leadsCategoryDetailsResponse) != null) {
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      _errormsg = e.toString();
      if (kDebugMode) {
        print("error: ${e.toString()}");
      }
      notifyListeners();
      return false;
    }
  }

  //own leads

  /*
  * get own leads list api call
  * */

  LeadsListOwnResponse? _leadsListOwnResponse;
  LeadsListOwnResponse? get leadsListOwnResponse => _leadsListOwnResponse;

  Future<bool> getLeadsListOwnApi(int page,
      {String? fromdate, String? todate, String? searchTerm}) async {
    try {
      LeadsListOwnResponse? leadsListOwnResponse =
          await apiRepository.getLeadsListOwn(page,
              fromdate: fromdate, todate: todate, searchTerm: searchTerm);
      if ((leadsListOwnResponse?.data ?? []).isNotEmpty) {
        _leadsListOwnResponse = leadsListOwnResponse;
        notifyListeners();
        return true;
      }
      _leadsListOwnResponse = null;
      notifyListeners();
      return false;
    } catch (e) {
      _errormsg = e.toString();
      if (kDebugMode) {
        print("error: ${e.toString()}");
      }
      notifyListeners();

      return false;
    }
  }

  List<LeadsListOwnList>? _leadsListOwnList = [];
  List<LeadsListOwnList>? get leadsListOwnList => _leadsListOwnList;
  bool _isLoadingleadsListOwnPagination = false;
  bool get isLoadingleadsListOwnPagination => _isLoadingleadsListOwnPagination;
  int _leadsListOwnCurrentPage = 0;
  bool _reachedLastPageleadsListOwn = false;
  bool get reachedLastPageleadsListOwn => _reachedLastPageleadsListOwn;

  Future<void> getLeadsListOwn({String? searchTerm}) async {
    if (_isLoadingleadsListOwnPagination || _reachedLastPageleadsListOwn) {
      return;
    }
    _isLoadingleadsListOwnPagination = true;
    await getLeadsListOwnApi(_leadsListOwnCurrentPage,
        fromdate: fromdate, todate: todate, searchTerm: searchTerm);
    final apiResponse = leadsListOwnResponse;
    final apiPosts = apiResponse?.data ?? [];
    if (apiPosts.length < 10) {
      _reachedLastPageleadsListOwn = true;
    }
    if (apiResponse != null) {
      if (apiPosts.isNotEmpty) {
        _leadsListOwnList?.addAll(apiPosts);
      }
      _leadsListOwnCurrentPage++;
    }
    _isLoadingleadsListOwnPagination = false;
    if ((leadsListOwnList ?? []).isNotEmpty) {
      notifyListeners();
    }
  }

  void resetleadsListOwnPagination() {
    _leadsListOwnList = [];
    _leadsListOwnCurrentPage = 0;
    _isLoadingleadsListOwnPagination = false;
    _reachedLastPageleadsListOwn = false;
    notifyListeners();
  }

  //

  //other leads

  /*
  * get other leads list api call
  * */

  LeadsListOwnResponse? _leadsListOtherResponse;
  LeadsListOwnResponse? get leadsListOtherResponse => _leadsListOtherResponse;

  Future<bool> getLeadsListOtherApi(int page, String uderID,
      {String? fromdate, String? todate, String? searchTerm}) async {
    try {
      LeadsListOwnResponse? leadsListOtherResponse =
          await apiRepository.getLeadsListOther(page, uderID,
              fromdate: fromdate, todate: todate, searchTerm: searchTerm);
      if ((leadsListOtherResponse?.data ?? []).isNotEmpty) {
        notifyListeners();
        _leadsListOtherResponse = leadsListOtherResponse;
        return true;
      }
      _leadsListOtherResponse = null;
      notifyListeners();
      return false;
    } catch (e) {
      _errormsg = e.toString();
      if (kDebugMode) {
        print("error: ${e.toString()}");
      }
      notifyListeners();

      return false;
    }
  }

  List<LeadsListOwnList>? _leadsListOtherList = [];
  List<LeadsListOwnList>? get leadsListOtherList => _leadsListOtherList;
  bool _isLoadingleadsListOtherPagination = false;
  bool get isLoadingleadsListOtherPagination =>
      _isLoadingleadsListOtherPagination;
  int _leadsListOtherCurrentPage = 0;
  bool _reachedLastPageleadsListOther = false;
  bool get reachedLastPageleadsListOther => _reachedLastPageleadsListOther;

  Future<void> getLeadsListOther(
      {String? searchTerm, required String uderID}) async {
    if (_isLoadingleadsListOtherPagination || _reachedLastPageleadsListOther) {
      return;
    }
    _isLoadingleadsListOtherPagination = true;
    notifyListeners();
    await getLeadsListOtherApi(_leadsListOtherCurrentPage, uderID,
        fromdate: fromdate, todate: todate, searchTerm: searchTerm);
    final apiResponse = leadsListOtherResponse;
    final apiPosts = apiResponse?.data ?? [];
    if (apiPosts.length < 10) {
      _reachedLastPageleadsListOther = true;
    }
    if (apiResponse != null) {
      if (apiPosts.isNotEmpty) {
        _leadsListOtherList?.addAll(apiPosts);
      }
      _leadsListOtherCurrentPage++;
    }
    _isLoadingleadsListOtherPagination = false;
    if ((leadsListOtherList ?? []).isNotEmpty) {
      notifyListeners();
    }
  }

  void resetleadsListOtherPagination() {
    _leadsListOtherList = [];
    _leadsListOtherCurrentPage = 0;
    _isLoadingleadsListOtherPagination = false;
    _reachedLastPageleadsListOther = false;
    notifyListeners();
  }
}
