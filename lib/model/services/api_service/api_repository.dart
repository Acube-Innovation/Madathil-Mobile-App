import 'dart:developer';

import 'package:madathil/constants.dart';
import 'package:madathil/model/model_class/api_response_model/login_response.dart';
import 'package:madathil/model/model_class/local/environment.dart';
import 'package:madathil/model/services/api_service/api_urls.dart';
import 'package:madathil/model/services/api_service/api_viewmodel.dart';

import 'package:madathil/model/services/local_db/hive_constants.dart';

class ApiRepository {
  ApiViewModel? _apiViewModel;

  ApiRepository() {
    _apiViewModel = ApiViewModel(Environment.dev);
  }

  Future<LoginResponse?> login({Map<String, dynamic>? data}) async {
    return _apiViewModel!
        .post<LoginResponse>(apiUrl: ApiUrls.klogin, data: data);
  }
}
