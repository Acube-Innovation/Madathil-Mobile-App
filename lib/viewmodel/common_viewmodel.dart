import 'dart:convert';
import 'dart:developer';
import 'dart:io' as dio;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:madathil/model/model_class/api_response_model/add_closing_statment_response.dart';
import 'package:madathil/model/model_class/api_response_model/attendance_list_response.dart';
import 'package:intl/intl.dart';
import 'package:madathil/model/model_class/api_response_model/checkin_checkout_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/checkin_checkout_response.dart';
import 'package:madathil/model/model_class/api_response_model/closing_statment_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/closingstatment_details_response.dart';
import 'package:madathil/model/model_class/api_response_model/customer_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/image_uploade_response.dart';
import 'package:madathil/model/model_class/api_response_model/item_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/service_history_detailsresponse.dart';
import 'package:madathil/model/model_class/api_response_model/service_history_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/service_status_list_response.dart';
import 'package:madathil/model/model_class/utility_model_class/customer_utility_model.dart';
import 'package:madathil/model/services/api_service/api_repository.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';
import 'package:madathil/view/screens/service_list/servce_detail.dart';

class CommonDataViewmodel extends ChangeNotifier {
  final ApiRepository apiRepository;

  CommonDataViewmodel({required this.apiRepository});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController dobController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime today = DateTime.now();
    final DateTime firstDate =
        DateTime(today.year - 100); // Allow dates up to 100 years ago
    final DateTime lastDate = DateTime(
        today.year - 18, today.month, today.day); // 18 years ago from today

    DateTime? pickedDate;

    await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 280,
          color: AppColors.white,
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: lastDate,
                  minimumDate: firstDate,
                  maximumDate: lastDate,
                  onDateTimeChanged: (DateTime dateTime) {
                    pickedDate = dateTime;
                    if (pickedDate != null) {
                      String formattedDate =
                          pickedDate!.toLocal().toString().split(' ')[0];

                      formattedDate;
                      dobController.text = formattedDate;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomButton(
                  text: 'Confirm',
                  onPressed: () {
                    if (pickedDate != null) {
                      String formattedDate =
                          pickedDate!.toLocal().toString().split(' ')[0];

                      formattedDate;
                      dobController.text = formattedDate;
                    }
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  int _selectedIndex = -1;

  int get selectedIndex => _selectedIndex;

  void selectIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  //

  String? _errormsg;
  String? get errormsg => _errormsg;

  bool? _isloading = false;
  bool? get isloading => _isloading;

  bool isMoreLoading = true;
  setMoreLoader(bool value) {
    isMoreLoading = value;
    notifyListeners();
  }

  /*
  * checin checkout api call
  * */

  Future<bool> employeeCheckin({String? logType}) async {
    try {
      _isloading = true;
      CheckInCheckOutResponse? response =
          await apiRepository.employeeCheckin(data: {
        "employee": "HR-EMP-00278",
        "log_type": logType,
        "latitude": "9.76686867",
        "longitude": "76.12312312"
      });
      if (response?.data != null) {
        _isloading = false;
        notifyListeners();
        return true;
      } else {
        _isloading = false;
        _errormsg = "";
        notifyListeners();
        return false;
      }
    } catch (e) {
      _isloading = false;
      _errormsg = e.toString();
      return false;
    }
  }

  /*
  * checin checkout List api call
  * */

  CheckInCheckOutListResponse? _checkOutListResponse;
  CheckInCheckOutListResponse? get checkOutListResponse =>
      _checkOutListResponse;

  Future<bool> employeeCheckinList({String? username, String? pwd}) async {
    try {
      _isloading = true;
      CheckInCheckOutListResponse? response =
          await apiRepository.employeeCheckinList();
      if ((response?.data ?? []).isNotEmpty) {
        _checkOutListResponse = response;
        _isloading = false;
        notifyListeners();
        return true;
      } else {
        _isloading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _isloading = false;
      _errormsg = e.toString();
      return false;
    }
  }

  /*
  * add closing statment
  * */

  Future<bool> addClosingStatment(
      {String? customerName,
      String? mobNo,
      String? address,
      String? item,
      String? business,
      String? kw,
      String? margin,
      String? expense}) async {
    try {
      AddClosingStatmentResponse? response =
          await apiRepository.addClosingStatment(data: {
        "customer_name": customerName,
        "mobile_no": mobNo,
        "address": address,
        "item": item,
        "kw": kw,
        "margin": margin,
        "expense": expense
      });

      if (response?.data != null) {
        notifyListeners();
        return true;
      } else {
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errormsg = e.toString();
      return false;
    }
  }

  /*
  * image picker
  * */
  final ImagePicker _picker = ImagePicker();

  XFile? _pickedImage;

  XFile? get pickedImage => _pickedImage;

  Future<XFile?> pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      _pickedImage = image;

      notifyListeners();
    }
    return pickedImage;
  }

  clearCustomerimage() {
    _pickedImage = null;

    notifyListeners();
  }

  ///// add point in ui

  final List<TextEditingController> _noteControllers = [];

  // Getter for the list of note controllers
  List<TextEditingController> get noteControllers => _noteControllers;

  // Method to add a new call point field (new TextEditingController)
  void addNoteField() {
    _noteControllers.add(TextEditingController());
    notifyListeners();
  }

  // Method to remove a call point field based on index
  void removeNoteField(int index) {
    _noteControllers[index]
        .dispose(); // Dispose the controller to avoid memory leaks
    _noteControllers.removeAt(index);
    notifyListeners();
  }

  void disposeControllers() {
    for (var controller in _noteControllers) {
      controller.dispose();
    }
    _noteControllers.clear();
    notifyListeners();
  }

  ///// Set reminder

  DateTime? selectedReminderDate;
  TimeOfDay? selectedReminderTime;

  // Function to set the selected date
  void setReminderDate(DateTime date) {
    selectedReminderDate = date;
    notifyListeners();
  }

  // Function to set the selected time
  void setReminderTime(TimeOfDay time) {
    selectedReminderTime = time;
    notifyListeners();
  }

  // Function to clear the reminder
  void clearReminder() {
    selectedReminderDate = null;
    selectedReminderTime = null;
    notifyListeners();
  }

  // Helper function to format the selected date and time to "dd MM yyyy, hh mm"
  String formatSelectedDateTime() {
    if (selectedReminderDate != null && selectedReminderTime != null) {
      final DateTime fullDateTime = DateTime(
        selectedReminderDate!.year,
        selectedReminderDate!.month,
        selectedReminderDate!.day,
        selectedReminderTime!.hour,
        selectedReminderTime!.minute,
      );
      return DateFormat('dd/MM/yyyy, hh:mm aa')
          .format(fullDateTime); // Changed format to "dd MM yyyy, hh mm"
    } else if (selectedReminderDate != null) {
      return DateFormat('dd MM yyyy')
          .format(selectedReminderDate!); // Only date
    } else {
      return "No Reminder Set";
    }
  }

  // Function to pick a date
  Future<void> selectDateR(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primeryColor, // Header color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primeryColor, // Button color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      setReminderDate(pickedDate);
    }
  }

  // Function to pick a time
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primeryColor, // Header color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primeryColor, // Button color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedTime != null) {
      setReminderTime(pickedTime);
    }
  }

  /// filter in service history

  // Holds the selected filter status
  String? _selectedDate; // Holds the selected filter date

  String? get selectedDate => _selectedDate;

  // Method to set the selected date
  void setSelectedDate(String? date) {
    _selectedDate = date;
    notifyListeners();
  }

  // Method to clear the filter status
  void clearSelectedStatus() {
    _selectedStatus = null;
    notifyListeners();
  }

  // Method to clear the selected date
  void clearSelectedDate() {
    _selectedDate = null;
    notifyListeners();
  }

  /*
  * attendance List api call
  * */

  AttendanceList? _attendanceList;
  AttendanceList? get attendanceList => _attendanceList;

  Future<bool> getAttendanceList() async {
    try {
      _isloading = true;
      AttendanceList? response = await apiRepository.getAttendanceList();
      if ((response?.data ?? []).isNotEmpty) {
        _attendanceList = response;
        _isloading = false;
        notifyListeners();
        return true;
      } else {
        _isloading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _isloading = false;
      _errormsg = e.toString();
      return false;
    }
  }

  /*
  * customer list api call
  * */

  List<String> _customers = [];
  List<String> get customers => _customers;

  Future<bool> getCustomerList({String? searchItem}) async {
    try {
      _isloading = true;

      Map<String, dynamic>? param = {};

      if (searchItem != null && searchItem.isNotEmpty) {
        param = {
          "fields": jsonEncode(["name", "customer_name"]),
          "filters": jsonEncode({
            "disabled": "false",
            "customer_name": ["like", "$searchItem%"]
          }),
          "order_by": "modified desc",
        };
      } else {
        param = {
          "fields": jsonEncode(["name", "customer_name"]),
          "filters": jsonEncode({
            "disabled": "false",
            "customer_name": ["like", "%"]
          }),
          "order_by": "modified desc",
        };
      }

      CustomerListResponse? response =
          await apiRepository.getCustomerList(param: param);

      if (response != null) {
        _customers = response.data!
            .map((customer) => customer.customerName ?? '')
            .toList();
        _isloading = false;
        notifyListeners();
        return true;
      } else {
        _isloading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errormsg = e.toString();
      _isloading = false;
      notifyListeners();
      return false;
    }
  }

  /*
  * item list api call
  * */

  List<String> _items = [];
  List<String> get items => _items;

  Future<bool> getItemList({String? searchItem}) async {
    try {
      _isloading = true;

      Map<String, dynamic>? param = {};

      if (searchItem != null && searchItem.isNotEmpty) {
        param = {
          "fields": jsonEncode(["name", "item_name"]),
          "filters": jsonEncode({
            "disabled": "false",
            "item_name": ["like", "$searchItem%"]
          }),
          "order_by": "modified desc",
        };
      } else {
        param = {
          "fields": jsonEncode(["name", "item_name"]),
          "filters": jsonEncode({
            "disabled": "false",
            "item_name": ["like", "%"]
          }),
          "order_by": "modified desc",
        };
      }

      ItemListResponse? response =
          await apiRepository.getItemList(param: param);

      if (response != null) {
        _items = response.data!.map((item) => item.itemName ?? '').toList();
        _isloading = false;
        notifyListeners();
        return true;
      } else {
        _isloading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errormsg = e.toString();
      _isloading = false;
      notifyListeners();
      return false;
    }
  }

  TextEditingController searchControllerClosingStament =
      TextEditingController();

  String? closingStatmentSearchfn;

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

  void setSearchValue(String val) {
    closingStatmentSearchfn = val;
    notifyListeners();
  }

  clearSearchVal() {
    closingStatmentSearchfn = null;
    searchControllerClosingStament.clear();
    notifyListeners();
  }

  /*
  * closing statment list api call
  * */

  ClosingStatmentListResponse? _closingListResponse;
  ClosingStatmentListResponse? get closingListResponse => _closingListResponse;
  List<ClosingStatmentList>? closingList = [];

  Future<bool> getClosingStatmentList({int? page}) async {
    try {
      _isloading = true;
      notifyListeners();

      Map<String, dynamic>? param = {};

      if (startFormatted != null && endFormatted != null) {
        param = {
          "fields": jsonEncode([
            "name",
            "customer_name",
            "project_cost",
            "closing_date",
            "mobile_number",
            "select_business",
            "customer_address",
            "item",
            "kw",
            "item_margin",
            "item_expense"
          ]),
          "filters": jsonEncode({
            "employee_id": "HR-EMP-00187",
            "closing_date": [
              "between",
              [startFormatted, endFormatted]
            ],
            "customer_name": [
              "like",
              closingStatmentSearchfn != null
                  ? "$closingStatmentSearchfn %"
                  : "%"
            ]
          }),
          "order_by": "modified desc",
          "limit": 10,
          "limit_start": page! * 10
        };
      } else {
        param = {
          "fields": jsonEncode([
            "name",
            "customer_name",
            "project_cost",
            "closing_date",
            "mobile_number",
            "select_business",
            "customer_address",
            "item",
            "kw",
            "item_margin",
            "item_expense"
          ]),
          "filters": jsonEncode({
            "employee_id": "HR-EMP-00187",
            "customer_name": [
              "like",
              closingStatmentSearchfn != null
                  ? "$closingStatmentSearchfn %"
                  : "%"
            ]
          }),
          "order_by": "modified desc",
          "limit": 10,
          "limit_start": page! * 10
        };
      }

      ClosingStatmentListResponse? response =
          await apiRepository.getClosingStatmentList(param: param);

      if (response?.data != null) {
        closingList?.clear;
        closingList = response?.data;

        log("closing List------------> ${closingList?.first.toJson() ?? []}");

        _isloading = false;
        notifyListeners();

        return true;
      }

      log("Empty list");
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

  int closingCurrentPage = 0;
  bool closingReachLength = false;
  List<ClosingStatmentList>? closePost = [];
  bool _paginationclosing = false;
  bool get ispaginationclosing => _paginationclosing;

  fetchClosingStatmentList() async {
    if (_paginationclosing || closingReachLength) {
      return;
    }

    _paginationclosing = true;

    await getClosingStatmentList(page: closingCurrentPage);
    final apiResponse = closingList;

    if (apiResponse != null) {
      final apiPosts = apiResponse;
      if (apiPosts.length < 10) {
        closingReachLength = true;
      }
      closePost?.addAll(apiPosts);
      closingCurrentPage++;
    }
    _paginationclosing = false;
    if ((closePost ?? []).isNotEmpty) {
      notifyListeners();
    }
  }

  void resetClosingPagination() {
    closingList?.clear();
    closePost?.clear();
    closingCurrentPage = 0;
    _paginationclosing = false;
    closingReachLength = false;
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

  /*
  * closing statment details api call
  * */

  ClosingStatementDetails? closingStatment;

  Future<bool> getClosingStatmentDetails({String? closingId}) async {
    try {
      Map<String, dynamic>? param = {};

      param = {
        "fields": jsonEncode([
          "name",
          "customer_name",
          "project_cost",
          "closing_date",
          "mobile_number",
          "select_business",
          "customer_address",
          "item",
          "kw",
          "item_margin",
          "item_expense"
        ]),
      };

      _isloading = true;
      notifyListeners();

      ClosingStatmentDetailsResponse? response = await apiRepository
          .getClosingStatmentDetails(param: param, closingId: closingId);

      if (response?.data != null) {
        closingStatment = null;
        closingStatment = response?.data;
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
  * service status list api call
  * */

  List<String>? _statusOptions;
  List<String>? get statusOptions => _statusOptions;

  Future<bool> getServiceStatusList() async {
    try {
      Map<String, dynamic>? param = {};

      param = {
        "doctype": "Maintenance Visit",
        "fieldname": "work_completion_status"
      };

      ServiceStatusListResponse? response =
          await apiRepository.getServiceStatusList(param: param);

      if (response?.message != null) {
        _statusOptions = response?.message;
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // Method to set the filter status
  String? _selectedStatus;
  String? get selectedStatus => _selectedStatus;
  void setSelectedStatus(String? status) {
    _selectedStatus = status;

    log(selectedStatus!);
    notifyListeners();
  }

  /*
  * service history list api call
  * */

  DateTime? _startservice;
  DateTime? _endservice;

  DateTime? get startservice => _startservice;
  DateTime? get endservice => _endservice;
  String? startDateService;
  String? endDateService;

  void setServiceDateRange(DateTime? start, DateTime? end) {
    _startservice = startservice;
    _endservice = endservice;
    startDateService = DateFormat('yyyy-MM-dd').format(start!);
    endDateService = DateFormat('yyyy-MM-dd').format(end!);
    dobController.text = "Start: $startDateService  End: $endDateService";

    notifyListeners();
  }

  ServiceHistoryListResponse? _serviceHistoryListResponse;
  ServiceHistoryListResponse? get serviceHistoryListResponse =>
      _serviceHistoryListResponse;
  List<ServiceHistory>? serviceHistoryList = [];

  Future<bool> getServiceHistoryList({int? page}) async {
    try {
      _isloading = true;
      notifyListeners();

      Map<String, dynamic>? param = {};

      if (startDateService != null &&
          endDateService != null &&
          selectedStatus == null) {
        param = {
          "fields": jsonEncode([
            "name",
            "customer",
            "mntc_date",
            "mntc_time",
            "completion_status",
            "work_completion_status",
            "maintenance_type"
          ]),
          "filters": jsonEncode({
            "mntc_date": [
              "between",
              [startDateService, endDateService]
            ],
            // "customer_name": [
            //   "like",
            //   closingStatmentSearchfn != null
            //       ? "$closingStatmentSearchfn %"
            //       : "%"
            // ]
          }),
          "order_by": "modified desc",
          "limit": 10,
          "limit_start": page! * 10
        };
      } else if (selectedStatus != null &&
          startDateService != null &&
          endDateService != null) {
        param = {
          "fields": jsonEncode([
            "name",
            "customer",
            "mntc_date",
            "mntc_time",
            "completion_status",
            "work_completion_status",
            "maintenance_type"
          ]),
          "filters": jsonEncode({
            "work_completion_status": selectedStatus,
            "mntc_date": [
              "between",
              [startDateService, endDateService]
            ],

            // "customer_name": [
            //   "like",
            //   closingStatmentSearchfn != null
            //       ? "$closingStatmentSearchfn %"
            //       : "%"
            // ]
          }),
          "order_by": "modified desc",
          "limit": 10,
          "limit_start": page! * 10
        };
      } else if (selectedStatus != null &&
          startDateService == null &&
          endDateService == null) {
        param = {
          "fields": jsonEncode([
            "name",
            "customer",
            "mntc_date",
            "mntc_time",
            "completion_status",
            "work_completion_status",
            "maintenance_type"
          ]),
          "filters": jsonEncode({
            "work_completion_status": selectedStatus,
            // "customer_name": [
            //   "like",
            //   closingStatmentSearchfn != null
            //       ? "$closingStatmentSearchfn %"
            //       : "%"
            // ]
          }),
          "order_by": "modified desc",
          "limit": 10,
          "limit_start": page! * 10
        };
      } else {
        param = {
          "fields": jsonEncode([
            "name",
            "customer",
            "mntc_date",
            "mntc_time",
            "completion_status",
            "work_completion_status",
            "maintenance_type"
          ]),
          "filters": jsonEncode({
            // "customer_name": [
            //   "like",
            //   closingStatmentSearchfn != null
            //       ? "$closingStatmentSearchfn %"
            //       : "%"
            // ]
          }),
          "order_by": "modified desc",
          "limit": 10,
          "limit_start": page! * 10
        };
      }

      ServiceHistoryListResponse? response =
          await apiRepository.getServiceHistoryList(param: param);

      if (response?.data != null) {
        serviceHistoryList?.clear();
        serviceHistoryList = response?.data;

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

  int serviceHistoryCurrentPage = 0;
  bool serviceHistoryReachLength = false;
  List<ServiceHistory>? serviceHistoryPost = [];
  bool _paginationserviceHistory = false;
  bool get ispaginationserviceHistory => _paginationserviceHistory;

  fetchServiceHistoryList() async {
    if (_paginationserviceHistory || serviceHistoryReachLength) {
      log("not.............");
      return;
    }

    _paginationserviceHistory = true;

    log("sure.............");

    await getServiceHistoryList(page: serviceHistoryCurrentPage);

    final apiResponse = serviceHistoryList;

    if (apiResponse != null) {
      final apiPosts = apiResponse;
      if (apiPosts.length < 10) {
        serviceHistoryReachLength = true;
      }
      serviceHistoryPost?.addAll(apiPosts);
      serviceHistoryCurrentPage++;
    }
    _paginationserviceHistory = false;
    if ((serviceHistoryPost ?? []).isNotEmpty) {
      notifyListeners();
    }
  }

  void resetServiceHistoryPagination() {
    serviceHistoryList?.clear();
    serviceHistoryPost?.clear();
    serviceHistoryCurrentPage = 0;
    _paginationserviceHistory = false;
    serviceHistoryReachLength = false;
    notifyListeners();
  }

  void clearServiceDateRange() {
    _startservice = null;
    _endservice = null;
    startDateService = null;
    endDateService = null;
    dobController.clear();
    notifyListeners();
  }

  /*
  * service history details api call
  * */

  ServiceHistoryDetails? servicePurpose;

  Future<bool> getServiceHistoryDetails({String? serviecId}) async {
    try {
      _isloading = true;
      notifyListeners();

      Map<String, dynamic>? param = {};

      param = {
        "fields": jsonEncode([
          "name",
          "customer",
          "mntc_date",
          "mntc_time",
          "completion_status",
          "work_completion_status",
          "status",
          "purposes"
        ]),
      };

      ServiceHistoryDetailsResponse? response = await apiRepository
          .getServiceHistoryDetails(serviceId: serviecId, param: param);

      if (response?.data != null) {
        servicePurpose = response?.data;

        log("list -------------- ${response?.data?.toJson()}");
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

  resetServiceDetails() {
    servicePurpose = null;
  }
}
