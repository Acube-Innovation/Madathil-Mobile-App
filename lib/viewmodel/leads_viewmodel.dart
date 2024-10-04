import 'package:flutter/foundation.dart';
import 'package:madathil/model/model_class/api_response_model/create_address_response_model.dart';
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
        notifyListeners();
        _leadsListOwnResponse = leadsListOwnResponse;
        return true;
      }
      _leadsListOwnList = null;
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

  // upcoming bookings pagination

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
    if (apiResponse != null) {
      final apiPosts = apiResponse.data ?? [];
      if (apiPosts.length < 10) {
        _reachedLastPageleadsListOwn = true;
      }
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
}
