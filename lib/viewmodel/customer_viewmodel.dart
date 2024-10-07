import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:madathil/model/model_class/api_response_model/create_address_response_model.dart';
import 'package:madathil/model/model_class/api_response_model/create_customer_response.dart';
import 'package:madathil/model/model_class/api_response_model/customer_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/get_customer_address_response.dart';
import 'package:madathil/model/model_class/api_response_model/get_customer_detail_response.dart';
import 'package:madathil/model/model_class/api_response_model/image_uploade_response.dart';
import 'package:madathil/model/model_class/utility_model_class/customer_utility_model.dart';
import 'package:madathil/model/services/api_service/api_repository.dart';

class CustomerViewmodel extends ChangeNotifier {
  final ApiRepository apiRepository;

  CustomerViewmodel({required this.apiRepository});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _errormsg;
  String? get errormsg => _errormsg;

  bool isLoading = true;
  setLoader(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Customer? _selectedAddress;
  Customer? get selectedAddress => _selectedAddress;

  void selectValue(Customer addrs) {
    _selectedAddress = addrs;
    log("selectedAddress----->${_selectedAddress?.toJson()}");
    notifyListeners(); // Notify listeners when the value changes
  }

  TextEditingController searchController = TextEditingController();

  /*
  *  getCustomerList  api call
  * */
  String? customerSearchfn;
  List<Customer>? customerList = [];

  Future<bool> getCustomerList({int? page}) async {
    try {
      setLoader(true);
      Map<String, dynamic> filters = {};
      if ((customerSearchfn != null) && (customerSearchfn!.isNotEmpty)) {
        filters["customer_name"] = ["like", "%$customerSearchfn%"];
        filters["disabled"] = "false";
      } else {
        filters["disabled"] = "false";
      }

      CustomerListResponse? response =
          await apiRepository.getCustomerList(param: {
        "fields": jsonEncode(
            ["name", "customer_name", "image", "email_id", "mobile_no"]),
        "filters": jsonEncode(filters),
        // jsonEncode({"disabled": "false"}),
        "order_by": "modified desc",
        "limit": 10,
        "limit_start": page! * 0
      });
      if ((response?.data ?? []).isNotEmpty) {
        customerList = response?.data;

        log("produtct detail------------> ${customerList?.first.toJson()}");
        setLoader(false);

        return true;
      } else {
        setLoader(false);
        return false;
      }
    } catch (e) {
      setLoader(false);
      _errormsg = e.toString();
      log(e.toString());
      return false;
    }
  }
  /*
  *  pagination--------------------
  * */

  int cstListCurrentPage = 0;
  bool cstListReachLength = false;
  List<Customer>? customerPost = [];
  bool _paginationcstList = false;
  bool get ispaginationcstList => _paginationcstList;

  fetchCustomerList({bool? isSolarProduct}) async {
    if (_paginationcstList || cstListReachLength) {
      return;
    }
    _paginationcstList = true;

    await getCustomerList(
      page: cstListCurrentPage,
    );
    final apiResponse = customerList;
    if (apiResponse != null) {
      final apiPosts = apiResponse;
      if (apiPosts.length < 10) {
        cstListReachLength = true;
      }
      customerPost?.addAll(apiPosts);
      cstListCurrentPage++;
    }
    _paginationcstList = false;
    if ((customerPost ?? []).isNotEmpty) {
      notifyListeners();
    }
  }

  void resetCustomerPagination() {
    customerList?.clear();
    customerPost?.clear();
    cstListCurrentPage = 0;
    _paginationcstList = false;
    cstListReachLength = false;
    notifyListeners();
  }

  void setSearchValue(String val) {
    customerSearchfn = val;
    notifyListeners();
  }

  clearSearch() {
    customerSearchfn = null;
    searchController.clear();
    notifyListeners();
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
    addCustomerUtilModelData(image: null);

    notifyListeners();
  }

  CustomerUtilModel? _customerUtilModel;
  CustomerUtilModel? get customerUtilModel => _customerUtilModel;

  addCustomerUtilModelData({
    String? name,
    String? phoneNumber,
    String? email,
    String? image,
  }) {
    _customerUtilModel = CustomerUtilModel(
        name: name ?? customerUtilModel?.name,
        phoneNumber: phoneNumber ?? customerUtilModel?.phoneNumber,
        email: email ?? customerUtilModel?.email,
        image: image ?? customerUtilModel?.image);
    notifyListeners();
  }

  CstAddressUtilModel? _cstAddressUtilModel;
  CstAddressUtilModel? get cstAddressUtilModel => _cstAddressUtilModel;

  addCstAddressUtilModelData({
    String? city,
    String? state,
    String? country,
    String? pincode,
    String? address1,
    String? address2,
  }) {
    _cstAddressUtilModel = CstAddressUtilModel(
      city: city ?? _cstAddressUtilModel?.city,
      pinCode: pincode ?? _cstAddressUtilModel?.pinCode,
      state: state ?? _cstAddressUtilModel?.state,
      country: country ?? _cstAddressUtilModel?.country,
      addressLine1: address1 ?? _cstAddressUtilModel?.addressLine1,
      addressLine2: address2 ?? _cstAddressUtilModel?.addressLine2,
    );
    notifyListeners();
  }

  clearCustomerForm() {
    _cstAddressUtilModel = null;
    _customerUtilModel = null;
    notifyListeners();
  }

  /*
  * file uploade api call
  * */

  Future<ImageUploadeResponse?> uploadDocument(
    File file,
  ) async {
    var data = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      ),
    });
    log("Image uploading continues");

    return await apiRepository.documentUpload(data);
  }

  /*
  * create customer api call
  * */
  CstData? customerData;

  Future<bool> createCustomer({CustomerUtilModel? utilModel}) async {
    try {
      var response = await apiRepository.createCustomer(data: {
        "customer_name": utilModel?.name,
        "customer_type": "Company", // Individual
        "customer_group": "All Customer Groups",
        "territory": "India",
        "email_id": utilModel?.email,
        "mobile_no": utilModel?.phoneNumber,
        "image": utilModel?.image
      });

      if (response?.data.doctype == "Customer") {
        customerData = response?.data;

        setLoader(false);
        return true;
      } else {
        setLoader(false);
        return false;
      }
    } catch (e) {
      _errormsg = e.toString();
      setLoader(false);
      return false;
    }
  }

  /*
  * create customer api call
  * */

  AddressData? addressData;

  Future<bool> createAddress(
      {String? name, CstAddressUtilModel? addrssutilModel}) async {
    try {
      var response = await apiRepository.createAddress(data: {
        "address_line1": addrssutilModel?.addressLine1,
        "address_line2": addrssutilModel?.addressLine2,
        "city": addrssutilModel?.city,
        "state": addrssutilModel?.state,
        "country": addrssutilModel?.country,
        "pincode": addrssutilModel?.pinCode,
        "links": [
          {
            "link_doctype": "Customer",
            //"Customer",
            "link_name": name // from customer name
          }
        ]
      });

      if (response?.data.doctype == "Address") {
        addressData = response?.data;

        setLoader(false);
        return true;
      } else {
        setLoader(false);
        return false;
      }
    } catch (e) {
      _errormsg = e.toString();
      setLoader(false);
      return false;
    }
  }

  /*
  *   getCustomerDetail  Api call-------------------->
  * */
  List<CstDetail>? customerDetails;

  Future<bool> getCustomerDetail({String? name}) async {
    setLoader(true);
    try {
      var response = await apiRepository.getCustomerDetails(data: {
        "fields": jsonEncode(
            ["name", "customer_name", "image", "email_id", "mobile_no"]),
        "filters": jsonEncode({"name": name})
      });

      if ((response?.data ?? []).isNotEmpty) {
        customerDetails = response?.data;

        setLoader(false);
        return true;
      } else {
        setLoader(false);
        return false;
      }
    } catch (e) {
      _errormsg = e.toString();
      setLoader(false);
      return false;
    }
  }

  /*
  *    getCustomerAddress  Api call-------------------->
  * */
  List<CustomerAddress>? customerAddress;

  Future<bool> getCustomerAddress({String? name}) async {
    try {
      setLoader(true);
      var response = await apiRepository.getCustomerAddress(data: {
        "doctype": "Address",
        "fields": jsonEncode([
          "address_line1",
          "address_line2",
          "city",
          "state",
          "country",
          "pincode"
        ]),
        "filters": jsonEncode(
            {"link_doctype": "Customer", "link_name": name, "disabled": false})
      });

      if ((response?.message ?? []).isNotEmpty) {
        customerAddress = response?.message;

        log("${customerAddress?.first.toJson()}");

        setLoader(false);
        return true;
      } else {
        setLoader(false);
        return false;
      }
    } catch (e) {
      _errormsg = e.toString();
      setLoader(false);
      return false;
    }
  }
}
