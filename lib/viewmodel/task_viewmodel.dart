import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:madathil/model/model_class/api_response_model/create_address_response_model.dart';
import 'package:madathil/model/model_class/api_response_model/lead_source_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/list_users_response.dart';
import 'package:madathil/model/model_class/api_response_model/task_creation_response.dart';
import 'package:madathil/model/model_class/api_response_model/task_detail_response.dart';
import 'package:madathil/model/model_class/api_response_model/task_list_others_response.dart';
import 'package:madathil/model/model_class/api_response_model/task_status_response.dart';
import 'package:madathil/model/services/api_service/api_repository.dart';

class TasksViewmodel extends ChangeNotifier {
  final ApiRepository apiRepository;

  TasksViewmodel({required this.apiRepository});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

//add task details
  bool? _isMyself;
  bool? get isMyself => _isMyself;

  addIsMyself(bool? val) {
    _isMyself = val;
    notifyListeners();
  }

  String? _filterStatus;
  String? get filterStatus => _filterStatus;

  addfilterStatus(String? val) {
    _filterStatus = val;
    notifyListeners();
  }

  String? _selectedAssignee;
  String? get selectedAssignee => _selectedAssignee;

  addSelectedAssignee(String? val) {
    _selectedAssignee = val;
    notifyListeners();
  }

  //clear filter
  clearFilter() {
    _filterStatus = null;
    _isMyself = false;
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
    try {
      LeadsSourceListResponse? tasksSourceDetailsResponse =
          await apiRepository.getSourceList();
      _isMyself = false;
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
  * get task users list details api call
  * */

  List<String>? _listUsersDetails;
  List<String>? get listUsersDetails => _listUsersDetails;

  ListUsersResponse? _listUsersResponse;
  ListUsersResponse? get listUsersResponse => _listUsersResponse;

  Future<bool> getListUsers() async {
    try {
      ListUsersResponse? listUsersDetailsResponse =
          await apiRepository.getListUsers();
      if (listUsersDetailsResponse != null &&
          listUsersDetailsResponse.data != null) {
        _listUsersResponse = listUsersDetailsResponse;
        _listUsersDetails = listUsersDetailsResponse.data
            ?.map((item) => item.fullName ?? '')
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
  * get  task type list details api call
  * */

  List<String>? _listTaskTypeDetails;
  List<String>? get listTaskTypeDetails => _listTaskTypeDetails;

  Future<bool> getListTaskType() async {
    try {
      LeadsSourceListResponse? listTaskTypeDetailsResponse =
          await apiRepository.getListTaskType();
      if (listTaskTypeDetailsResponse != null &&
          listTaskTypeDetailsResponse.data != null) {
        _listTaskTypeDetails = listTaskTypeDetailsResponse.data
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
  * get  task status list details api call
  * */

  List<String>? _listTaskStatusDetails;
  List<String>? get listTaskStatusDetails => _listTaskStatusDetails;

  Future<bool> getListTaskStatus() async {
    try {
      TaskStatusListResponse? listTaskStatusDetailsResponse =
          await apiRepository.getTaskStatusList();
      if (listTaskStatusDetailsResponse != null &&
          (listTaskStatusDetailsResponse.message ?? []).isNotEmpty) {
        _listTaskStatusDetails = listTaskStatusDetailsResponse.message;
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
      {String? fromdate, String? todate, String? searchTerm}) async {
    try {
      TasksListOthersResponse? tasksListOtherResponse =
          await apiRepository.getTaskListOthers(page,
              searchTerm: searchTerm,
              fromdate: fromdate,
              todate: todate,
              status: filterStatus);
      if ((tasksListOtherResponse?.data ?? []).isNotEmpty) {
        _tasksListOtherResponse = tasksListOtherResponse;
        notifyListeners();
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

  Future<void> getTasksListOther({String? searchTerm}) async {
    if (_isLoadingtasksListOtherPagination || _reachedLastPagetasksListOther) {
      return;
    }
    _isLoadingtasksListOtherPagination = true;
    notifyListeners();
    await getTasksListOthersApi(_tasksListOtherCurrentPage,
        fromdate: fromdate, todate: todate, searchTerm: searchTerm);
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
      notifyListeners();
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
