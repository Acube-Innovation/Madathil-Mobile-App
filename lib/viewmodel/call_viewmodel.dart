import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madathil/model/model_class/api_response_model/call_details_response.dart';
import 'package:madathil/model/model_class/api_response_model/call_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/create_call_response.dart';
import 'package:madathil/model/services/api_service/api_repository.dart';
import 'package:madathil/utils/color/app_colors.dart';

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
  TextEditingController durationController = TextEditingController();

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

  var formattedDate1;
  var formattedDate2;

  int calculateDuration(String date1, String date2) {
    formattedDate1 = DateFormat('dd/MM/yyyy, hh:mm a').parse(date1);
    formattedDate2 = DateFormat('dd/MM/yyyy, hh:mm a').parse(date2);
    print('the formatted date1 is $formattedDate1');
    String dateTime1 = DateFormat('yyyy-MM-dd HH:mm:ss').format(formattedDate1);
    String dateTime2 = DateFormat('yyyy-MM-dd HH:mm:ss').format(formattedDate2);
    DateTime requiredDate1 = DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateTime1);
    DateTime requiredDate2 = DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateTime2);
    Duration duration = requiredDate1.difference(requiredDate2);
    return duration.inSeconds;
  }

  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;

  // Function to set the selected date
  void setReminderDate(DateTime date, bool isEndDate) {
    if (isEndDate) {
      selectedEndDate = date;
    } else {
      selectedStartDate = date;
    }
    notifyListeners();
  }

  // Function to set the selected time
  void setReminderTime(TimeOfDay time, bool isEndTime) {
    if (isEndTime) {
      selectedEndTime = time;
    } else {
      selectedStartTime = time;
    }
    notifyListeners();
  }

  // Function to clear the reminder
  void clearReminder() {
    selectedStartDate = null;
    selectedStartTime = null;
    notifyListeners();
  }

  // Helper function to format the selected date and time to "dd MM yyyy, hh mm"
  String formatSelectedDateTime({bool isEndDate = false}) {
    if (isEndDate) {
      if (selectedEndDate != null && selectedEndTime != null) {
        final DateTime fullDateTime = DateTime(
          selectedEndDate!.year,
          selectedEndDate!.month,
          selectedEndDate!.day,
          selectedEndTime!.hour,
          selectedEndTime!.minute,
        );
        return DateFormat('dd/MM/yyyy, hh:mm aa')
            .format(fullDateTime); // Changed format to "dd MM yyyy, hh mm"
      } else if (selectedEndDate != null) {
        return DateFormat('dd/MM/yyyy').format(selectedEndDate!); // Only date
      } else {
        return "Unable to select time";
      }
    } else {
      if (selectedStartDate != null && selectedStartTime != null) {
        final DateTime fullDateTime = DateTime(
          selectedStartDate!.year,
          selectedStartDate!.month,
          selectedStartDate!.day,
          selectedStartTime!.hour,
          selectedStartTime!.minute,
        );
        return DateFormat('dd/MM/yyyy, hh:mm aa')
            .format(fullDateTime); // Changed format to "dd MM yyyy, hh mm"
      } else if (selectedStartDate != null) {
        return DateFormat('dd MM yyyy').format(selectedStartDate!); // Only date
      } else {
        return "Unable to select time";
      }
    }
  }

  // Function to pick a date
  Future<void> selectDateR(BuildContext context,
      {bool isEndDate = false}) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedStartDate ?? DateTime.now(),
      firstDate: DateTime(DateTime.now().month - 1),
      lastDate: selectedStartDate ?? DateTime.now(),
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
      setReminderDate(pickedDate, isEndDate);
    }
  }

  // Function to pick a time
  Future<void> selectTime(BuildContext context,
      {bool isEndDate = false}) async {
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
      setReminderTime(pickedTime, isEndDate);
    }
  }

  List<String>? callStatuslist = [
    "Lead",
    "Issue",
    "Answered",
    "Connected",
    "No answer",
    "Not connected",
    "Cancel",
    "Busy",
    "Channel limit exceeded"
  ];
  String? callStatus;

  void updateCallStatus(String? status) {
    callStatus = status;
    notifyListeners(); // This ensures the UI is rebuilt when callStatus changes
  }

  Future<void> getCallStatusList() async {
    try {
      var response = await apiRepository.getCallStatusList();
      if (response?['message'] != null) {
        callStatuslist = response?['message'];
      }
    } catch (e) {
      print(e);
    }
  }

  final mainPointController = TextEditingController();
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

  // Method to collect all points into a list
  List<String> collectAllPoints() {
    List<String> allPoints = [];

    // Add the value from the main 'Add points' field
    if (mainPointController.text.isNotEmpty) {
      allPoints.add(mainPointController.text);
    }

    // Add the values from the dynamic call points fields
    for (var controller in _noteControllers) {
      if (controller.text.isNotEmpty) {
        allPoints.add(controller.text);
      }
    }

    return allPoints;
  }

  void disposeControllers() {
    for (var controller in _noteControllers) {
      controller.dispose();
    }
    // mainPointController.dispose();
    mainPointController.clear();
    callStatus = null;
    _noteControllers.clear();
    notifyListeners();
  }

  /* create call api 
 */

  CreateCall? createCallData;

  Future<bool> createCall(
      {String? customerName,
      String? customerNumber,
      int? conversationDuration,
      String? status,
      List<String?>? points}) async {
    try {
      // Initialize trackCall as an empty list
      List<Map<String, dynamic>> trackCall = [];
      String? calledDate;
      String? startTime;
      String? endTime;

      // Check if points list is not null and not empty
      if (points != null && points.isNotEmpty) {
        trackCall = points.map((point) {
          return {
            "date_and_time":
                "2024-09-27 12:12:12", // You can replace this with dynamic data if needed
            "status": status ?? "Lead", // Default to "Lead" if status is null
            "feedback": point, // Use the feedback from the points list
            "userlink":
                "acubeadmin@gmail.com" // Adjust this based on your requirements
          };
        }).toList();
      }
      if (selectedStartDate != null) {
        calledDate = selectedStartDate.toString();
      }
      if (formattedDate1 != null && formattedDate2 != null) {
        startTime = formattedDate1.toString();
        endTime = formattedDate2.toString();
      }

      var response = await apiRepository.createCall(data: {
        "customer": customerName,
        "called_number": customerNumber,
        "caller_number": "9632587410",
        "called_date": calledDate,
        "call_date_time": startTime,
        "call_start_time": startTime,
        "call_end_time": endTime,
        "call_status": status,
        "conversation_duration": conversationDuration,
        "track_calls":
            trackCall // Always send an empty list if there are no points
      });

      if (response?.data?.doctype == "Customer Call Records") {
        createCallData = response?.data;

        setLoader(false);
        return true;
      } else {
        setLoader(false);
        return false;
      }
    } catch (e) {
      _errormsg = e.toString();
      setLoader(false);
      return false;
    }
  }
}
