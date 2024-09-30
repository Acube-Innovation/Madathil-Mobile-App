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
      '/api/resource/Attendance?fields=["name", "attendance_date", "employee_in_time", "employee_out_time", "status", "city", "state", "area"]&filters={"employee": "HR-EMP-00145", "attendance_date": ["between", ["2024-04-10", "2024-05-10"]]}';

  static const kAddClosingStatment = '/api/resource/Closing Statement';
  static const kCustomerList = '/api/resource/Customer';
  static const kItemList = '/api/resource/Item';
  static const kgetProductList =
      '/api/method/a3sola_solar_management.api.get_item_list';
  static const kgetProductDetail =
      '/api/method/a3sola_solar_management.api.get_item_details';
  static const kgetCustomerList = '/api/resource/Customer';
  static const kFileUploade = '/api/method/upload_file';
  static const kCreateCustomer = '/api/resource/Customer';
  static const kCreateAddress = '/api/resource/Address';

  static const kcustomer = '/api/resource/Customer';

  static const kCustomerAddress =
      '/api/method/a3sola_solar_management.api.get_doctype_data';
  static const kCreateCheckOut = "/api/resource/Sales Order";
}
