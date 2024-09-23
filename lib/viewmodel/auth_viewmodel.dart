import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madathil/model/model_class/api_response_model/login_response.dart';
import 'package:madathil/model/services/api_service/api_repository.dart';

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

  Future<bool> login({String? phone}) async {
    try {
      LoginResponse? sentotpResponse = await apiRepository
          .login({"mobile_no": "9876543210", "action": "sign in"});
      if (sentotpResponse?.message?.success ?? false) {
        return true;
      }
      _errormsg = sentotpResponse?.message?.message;
      return false;
    } catch (e) {
      _errormsg = e.toString();
      return false;
    }
  }

  setObscure(bool value) {
    obscureText = !value;
    notifyListeners();
  }
}
