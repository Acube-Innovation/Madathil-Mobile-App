class ApiUrls {
  //dev endpoint
  static const kStagingBaseURL = 'https://madathila3sola.frappe.cloud';

  //live endpoint
  static const kProdBaseURL = 'https://madathila3sola.frappe.cloud';
  static const klogin = '/api/method/login';
  static const kCheckinCheckoutList =
      '/api/resource/Employee Checkin?fields=["name", "time", "log_type"]';
  static const kCheckinCheckout = '/api/resource/Employee Checkin';
  static const kAttendanceHistory =
      '/api/resource/Attendance?fields=["name", "attendance_date", "employee_in_time", "employee_out_time", "status", "city", "state", "area"]';
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
  static const kServiceHistory = '/api/resource/Maintenance Visit/';
  static const kServiceStatus =
      '/api/method/a3sola_solar_management.api.get_select_field_options';
  static const kAddServiceHistory = '/api/resource/Maintenance Visit';

  // payment section
  static const kPaymentHistoryList = '/api/resource/Payment Entry';
  static const kpaymentModeList = '/api/resource/Mode of Payment';

  //tasks section
  static const ktaskListOthers =
      '/api/resource/Task?fields=["name","customer","subject","status","contact_number","type","subject","description","exp_start_date","exp_end_date","expected_time"]';
  static const ktaskStatusList =
      '/api/method/a3sola_solar_management.api.get_select_field_options?doctype=Task&fieldname=status';
  static const ktaskStatusUpdate = '/api/resource/Task/';
  static const ktaskDetail = '/api/resource/Task/';
  static const ktaskCreation = '/api/resource/Task';
  static const kGetOrders = '/api/resource/Sales Order';
  static const kCreatePayment =
      '/api/method/a3sola_solar_management.api.make_payment';
  static const kPaymentMethod = '/api/resource/Mode of Payment';

  //srvice
  static const kSalesPersonListServic = '/api/resource/Sales Person';
//call management section
  static const kCallList = '/api/resource/Customer Call Records';
  static const kAddCall = '/api/resource/Customer Call Records';
  static const kCallStatusList =
      '/api/method/a3sola_solar_management.api.get_select_field_options?doctype=Voxbay Call Track&fieldname=status';
  static const kListUsers =
      '/api/resource/User?fields=["name", "full_name"]&filters={"full_name": ["like", "aj%"]}&order_by=modified desc';
  static const kListTaskType =
      '/api/resource/Task Type?fields=["name"]&filters={"name": ["like", "%"]}&order_by=modified desc';

  // employee list section

  static const kEmployeeList =
      '/api/method/a3sola_solar_management.api.get_employee_list';
  static const kEmployeeDetails = '/api/resource/Employee/';

  // profile section
  static const kUserProfile =
      '/api/method/a3sola_solar_management.api.get_profile_details';

  //points section

  static const kPointList =
      '/api/method/a3sola_solar_management.api.total_points_list';

  static const kPointDetails =
      '/api/method/a3sola_solar_management.api.total_points_details';
  static const korderStatus =
      '/api/method/a3sola_solar_management.api.get_select_field_options';
  static const korderDetails =
      '/api/method/a3sola_solar_management.api.get_order_and_invoice_details';
  static const kgetInvoice =
      '/api/method/frappe.utils.print_format.download_pdf';

  static const kHomeDataUrl =
      '/api/method/a3sola_solar_management.api.get_home_details';

  static const kOrderTransactionList = '/api/resource/Payment Entry';

  static const kbrands = '/api/resource/Brand';
  static const kForgotPassword =
      '/api/method/frappe.core.doctype.user.user.reset_password';

  static const kmonthlypayments =
      '/api/method/a3sola_solar_management.api.get_monthly_payment_summary';
  static const kmonthlypaymentsdetails =
      '/api/method/a3sola_solar_management.api.get_monthly_payment_details';
  static const kMonthlySalary =
      '/api/method/a3sola_solar_management.api.get_monthly_summary_for_user';
  static const kMonthlySalaryDetails =
      '/api/method/a3sola_solar_management.api.get_monthly_details_for_user';

  static const kQuotation = '/api/resource/Quotation';
  static const kFiles = '/api/resource/File';

  static const kEmployeeDropDown = '/api/resource/User';
  static const kAssignEmployee = '/api/method/frappe.desk.form.assign_to.add';

  static const kDownloadPaymentReciept =
      '/api/method/frappe.utils.print_format.download_pdf';

  static const kGeneratePaymentLink =
      '/api/method/a3sola_solar_management.a3sola_solar_management.doctype.razorpay_payment_link.razorpay_payment_link.create_payment_link';

      static const kOngoingTransaction = '/api/resource/Razorpay Payment Link';
}
