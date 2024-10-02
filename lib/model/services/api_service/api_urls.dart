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

  //leads section
  static const kleadListOwn =
      '/api/resource/Lead?fields=["name", "lead_name", "address_line1", "address_line2", "city", "state", "country", "pincode", "ld_source", "lead_category", "number_to_be_contacted", "email_id", "aadhaar_number", "consumer_number", "status", "lead_owner", "creation"]&order_by=modified desc';
  static const kLeadDetails = '/api/resource/Lead/';
  static const kLeadSourceList = '/api/resource/Lead Source';
  static const kLeadCategoryList = '/api/resource/Lead Category';
  static const kLeadCreation = '/api/resource/Lead';
  static const kcreateAddress = '/api/resource/Address';
  static const kPaymentHistoryList = '/api/resource/Payment Entry';

  //tasks section
  static const ktaskListOthers =
      '/api/resource/Task?fields=["name","customer","subject","status","contact_number","type","subject","description","exp_start_date","exp_end_date","expected_time"]';
  static const ktaskStatusList =
      '/api/method/a3sola_solar_management.api.get_select_field_options?doctype=Task&fieldname=status';
  static const ktaskDetail = '/api/resource/Task/';
  static const ktaskCreation = '/api/resource/Task';
}
