import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/model/model_class/api_response_model/login_response.dart';
import 'package:madathil/model/services/api_service/api_repository.dart';
import 'package:madathil/utils/color/util_functions.dart';

class AuthViewmodel extends ChangeNotifier {
  final ApiRepository apiRepository;

  AuthViewmodel({required this.apiRepository});

  String? _errormsg;
  String? get errormsg => _errormsg;

  bool? _isloading;
  bool? get isloading => _isloading;
  bool? obscureText = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  /*
  * login api call
  * */
  LoginResponse? logindata;
  Future<bool> login({String? username, String? pwd}) async {
    try {
      LoginResponse? response =
          await apiRepository.login(data: {"usr": username, "pwd": pwd});
      if (UtilFunctions.checkAPIStatus(response?.message == 'Logged In') ??
          false) {
        logindata = response;
        notifyListeners();
        return true;
      } else {
        _errormsg = "Invalid login credentials";
        log(_errormsg.toString());
        notifyListeners();
        return false;
      }
    } catch (e) {
      log(e.toString());
      _errormsg = e.toString();
      return false;
    }
  }

  setObscure(bool value) {
    obscureText = !value;
    notifyListeners();
  }
}
