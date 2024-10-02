import 'package:flutter/foundation.dart';
import 'package:madathil/model/model_class/api_response_model/create_address_response_model.dart';
import 'package:madathil/model/model_class/api_response_model/lead_source_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/task_creation_response.dart';
import 'package:madathil/model/model_class/api_response_model/task_detail_response.dart';
import 'package:madathil/model/model_class/api_response_model/task_list_others_response.dart';
import 'package:madathil/model/services/api_service/api_repository.dart';

class TasksViewmodel extends ChangeNotifier {
  final ApiRepository apiRepository;

  TasksViewmodel({required this.apiRepository});
  String? _errormsg;
  String? get errormsg => _errormsg;

  bool isLoading = true;
  setLoader(bool value) {
    isLoading = value;
    notifyListeners();
  }

  DateTime? _fromdate;
  DateTime? get fromdate => _fromdate;

  DateTime? _todate;
  DateTime? get todate => _todate;

  addFromToTime(DateTime fromdate, DateTime todate) {
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

  TasksDetailsResponse? _tasksDetails;
  TasksDetailsResponse? get tasksDetails => _tasksDetails;

  Future<bool> getTaskDetails({String? id}) async {
    if ((tasksDetails?.data) != null) {
      notifyListeners();
    }
    try {
      TasksDetailsResponse? tasksDetailsResponse =
          await apiRepository.getTaskDetails(id);
      if ((tasksDetailsResponse?.data) != null) {
        _tasksDetails = tasksDetailsResponse;
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

  List<String>? _tasksSourceDetails;
  List<String>? get tasksSourceDetails => _tasksSourceDetails;

  Future<bool> getLeadsSourceList() async {
    if ((tasksDetails?.data) != null) {
      notifyListeners();
    }
    try {
      LeadsSourceListResponse? tasksSourceDetailsResponse =
          await apiRepository.getSourceList();
      if (tasksSourceDetailsResponse != null &&
          tasksSourceDetailsResponse.data != null) {
        _tasksSourceDetails = tasksSourceDetailsResponse.data
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
  * tasks creation api call
  * */

  String? _leadCreationDetails;
  String? get leadCreationDetails => _leadCreationDetails;

  Future<bool> createTask(Map<String, dynamic> data) async {
    try {
      TasksCreationResponse? tasksCreationResponse =
          await apiRepository.createTask(data);
      if ((tasksCreationResponse?.data) != null) {
        _leadCreationDetails = tasksCreationResponse?.data?.name ?? "";
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
  * tasks address creation api call
  * */

  Future<bool> createLeadAddress(Map<String, dynamic> data) async {
    try {
      CreateAddressResponse? tasksCategoryDetailsResponse =
          await apiRepository.createAddress(data: data);
      if ((tasksCategoryDetailsResponse) != null) {
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

  //others tasks

  /*
  * get others tasks list api call
  * */

  TasksListOthersResponse? _tasksListOtherResponse;
  TasksListOthersResponse? get tasksListOtherResponse =>
      _tasksListOtherResponse;

  Future<bool> getTasksListOthersApi(int page,
      {DateTime? fromdate, DateTime? todate, String? status}) async {
    if ((tasksListOtherResponse?.data ?? []).isNotEmpty) {
      notifyListeners();
    }
    try {
      TasksListOthersResponse? tasksListOtherResponse =
          await apiRepository.getTaskListOthers(page,
              fromdate: fromdate, todate: todate, status: status);
      if ((tasksListOtherResponse?.data ?? []).isNotEmpty) {
        notifyListeners();
        _tasksListOtherResponse = tasksListOtherResponse;
        return true;
      }
      _tasksListOtherList = null;
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

  List<TasksListOthersData>? _tasksListOtherList = [];
  List<TasksListOthersData>? get tasksListOtherList => _tasksListOtherList;
  bool _isLoadingtasksListOtherPagination = false;
  bool get isLoadingtasksListOtherPagination =>
      _isLoadingtasksListOtherPagination;
  int _tasksListOtherCurrentPage = 0;
  bool _reachedLastPagetasksListOther = false;
  bool get reachedLastPagetasksListOther => _reachedLastPagetasksListOther;

  Future<void> getTasksListOther() async {
    if (_isLoadingtasksListOtherPagination || _reachedLastPagetasksListOther) {
      return;
    }
    _isLoadingtasksListOtherPagination = true;
    await getTasksListOthersApi(_tasksListOtherCurrentPage,
        fromdate: fromdate, todate: todate);
    final apiResponse = tasksListOtherResponse;
    if (apiResponse != null) {
      final apiPosts = apiResponse.data ?? [];
      if (apiPosts.length < 10) {
        _reachedLastPagetasksListOther = true;
      }
      if (apiPosts.isNotEmpty) {
        _tasksListOtherList?.addAll(apiPosts);
      }
      _tasksListOtherCurrentPage++;
    }
    _isLoadingtasksListOtherPagination = false;
    if ((tasksListOtherList ?? []).isNotEmpty) {
      notifyListeners();
    }
  }

  void resettasksListOtherPagination() {
    _tasksListOtherList = [];
    _tasksListOtherCurrentPage = 0;
    _isLoadingtasksListOtherPagination = false;
    _reachedLastPagetasksListOther = false;
    notifyListeners();
  }
}
