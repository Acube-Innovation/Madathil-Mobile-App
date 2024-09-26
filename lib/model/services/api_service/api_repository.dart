import 'package:madathil/model/model_class/api_response_model/attendance_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/checkin_checkout_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/checkin_checkout_response.dart';
import 'package:madathil/model/model_class/api_response_model/login_response.dart';
import 'package:madathil/model/model_class/local/environment.dart';
import 'package:madathil/model/services/api_service/api_urls.dart';
import 'package:madathil/model/services/api_service/api_viewmodel.dart';

class ApiRepository {
  ApiViewModel? _apiViewModel;

  ApiRepository() {
    _apiViewModel = ApiViewModel(Environment.dev);
  }

  Future<LoginResponse?> login({Map<String, dynamic>? data}) async {
    return _apiViewModel!
        .login<LoginResponse>(apiUrl: ApiUrls.klogin, data: data);
  }

  Future<CheckInCheckOutResponse?> employeeCheckin(
      {Map<String, dynamic>? data}) async {
    return _apiViewModel!.post<CheckInCheckOutResponse>(
        apiUrl: ApiUrls.kCheckinCheckout, data: data);
  }

  Future<CheckInCheckOutListResponse?> employeeCheckinList() async {
    return _apiViewModel!
        .get<CheckInCheckOutListResponse>(apiUrl: ApiUrls.kCheckinCheckoutList);
  }

  Future<AttendanceList?> getAttendanceList() async {
    return _apiViewModel!
        .get<AttendanceList>(apiUrl: ApiUrls.kAttendanceHistory);
  }
}
