import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/model/model_class/api_response_model/checkin_checkout_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/checkin_checkout_response.dart';
import 'package:madathil/model/services/api_service/api_repository.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';

class CommonDataViewmodel extends ChangeNotifier {
  final ApiRepository apiRepository;

  CommonDataViewmodel({required this.apiRepository});

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
}
