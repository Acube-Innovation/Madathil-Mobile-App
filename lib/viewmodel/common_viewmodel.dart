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
import 'package:madathil/model/model_class/api_response_model/customer_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/image_uploade_response.dart';
import 'package:madathil/model/model_class/api_response_model/item_list_response.dart';
import 'package:madathil/model/model_class/utility_model_class/customer_utility_model.dart';
import 'package:madathil/model/services/api_service/api_repository.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';

class CommonDataViewmodel extends ChangeNotifier {
  final ApiRepository apiRepository;

  CommonDataViewmodel({required this.apiRepository});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController dobController = TextEditingController();

  String _selectedpayment = '';

  String get selectedpayment => _selectedpayment;
  void selectPayment(String value) {
    _selectedpayment = value;
    notifyListeners(); // Notify listeners when the value changes
  }

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

  String? _selectedStatus; // Holds the selected filter status
  String? _selectedDate; // Holds the selected filter date

  String? get selectedStatus => _selectedStatus;
  String? get selectedDate => _selectedDate;

  // Method to set the filter status
  void setSelectedStatus(String? status) {
    _selectedStatus = status;
    notifyListeners();
  }

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
}
