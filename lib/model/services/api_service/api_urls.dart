class ApiUrls {
  //dev endpoint
  static const kStagingBaseURL = 'https://madathiltest.frappe.cloud';

  //live endpoint
  static const kProdBaseURL = 'https://madathiltest.frappe.cloud';

  static const klogin = '/api/method/login';
  static const kCheckinCheckoutList =
      '/api/resource/Employee Checkin?fields=["name", "time", "log_type"]&filters={"employee": "HR-EMP-00278", "date": "2023-09-28"}&order_by=modified desc';
  static const kCheckinCheckout = '/api/resource/Employee Checkin';
  static const kAttendanceHistory =
      '/api/resource/Employee Checkin?fields=["employee", "date", "modified"]&filters={"employee": "HR-EMP-00278", "date": "2023-09-21"}&order_by=modified desc&limit=10&limit_start=0';
}
