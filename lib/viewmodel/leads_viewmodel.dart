import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:madathil/model/model_class/api_response_model/assign_employee_lead_response.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/foundation.dart';
import 'package:madathil/model/model_class/api_response_model/create_address_response_model.dart';
import 'package:madathil/model/model_class/api_response_model/get_quotation_lead_response.dart';
import 'package:madathil/model/model_class/api_response_model/image_uploade_response.dart';
import 'package:madathil/model/model_class/api_response_model/lead_creation_response.dart';
import 'package:madathil/model/model_class/api_response_model/lead_list_own_response.dart';
import 'package:madathil/model/model_class/api_response_model/lead_source_list_response.dart';
import 'package:madathil/model/model_class/api_response_model/leads_detail_response.dart';
import 'package:madathil/model/model_class/api_response_model/quotation_filer_response.dart';
import 'package:madathil/model/services/api_service/api_repository.dart';
import 'package:path_provider/path_provider.dart';

class LeadsViewmodel extends ChangeNotifier {
  final ApiRepository apiRepository;

  LeadsViewmodel({required this.apiRepository});
  String? _errormsg;
  String? get errormsg => _errormsg;

  bool isLoading = true;
  setLoader(bool value) {
    isLoading = value;
    notifyListeners();
  }

  String? _fromdate;
  String? get fromdate => _fromdate;

  String? _todate;
  String? get todate => _todate;

  addFromToTime(String fromdate, String todate) {
    _fromdate = fromdate;
    _todate = todate;
    notifyListeners();
  }

  void clearDates() {
    _fromdate = null;
    _todate = null;
    notifyListeners();
  }

  /*
  * get lead details api call
  * */

  LeadsDetailsResponse? _leadsDetails;
  LeadsDetailsResponse? get leadsDetails => _leadsDetails;

  Future<bool> getLeadsDetails({String? id}) async {
    try {
      LeadsDetailsResponse? leadsDetailsResponse =
          await apiRepository.getLeadsDetails(id);
      if ((leadsDetailsResponse?.data) != null) {
        _leadsDetails = leadsDetailsResponse;
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      _errormsg = e.toString();
      if (kDebugMode) {
        print("error: ${e.toString()}");
      }
      notifyListeners();

      return false;
    }
  }

  /*
  * get lead Source details api call
  * */

  List<String>? _leadsSourceDetails;
  List<String>? get leadsSourceDetails => _leadsSourceDetails;

  Future<bool> getLeadsSourceList() async {
    try {
      LeadsSourceListResponse? leadsSourceDetailsResponse =
          await apiRepository.getSourceList();
      if (leadsSourceDetailsResponse != null &&
          leadsSourceDetailsResponse.data != null) {
        _leadsSourceDetails = leadsSourceDetailsResponse.data
            ?.map((item) => item.name ?? '')
            .toList();
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      _errormsg = e.toString();
      if (kDebugMode) {
        print("error: ${e.toString()}");
      }
      notifyListeners();

      return false;
    }
  }

  /*
  * get lead category details api call
  * */

  List<String>? _leadsCategoryDetails = [];
  List<String>? get leadsCategoryDetails => _leadsCategoryDetails;

  Future<bool> getLeadsCategoryDetails() async {
    try {
      LeadsSourceListResponse? leadsCategoryDetailsResponse =
          await apiRepository.getCategoryList();
      if (leadsCategoryDetailsResponse != null &&
          leadsCategoryDetailsResponse.data != null) {
        _leadsCategoryDetails = leadsCategoryDetailsResponse.data
            ?.map((item) => item.name ?? '')
            .toList();
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      _errormsg = e.toString();
      if (kDebugMode) {
        print("error: ${e.toString()}");
      }
      notifyListeners();

      return false;
    }
  }

  /*
  * leads creation api call
  * */

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

    return await apiRepository.documentUpload(data);
  }

  String? _leadCreationImage;
  String? get leadCreationImage => _leadCreationImage;

  addImage(String? val) {
    _leadCreationImage = val;
    notifyListeners();
  }

  removeImage() {
    _leadCreationImage = null;
    notifyListeners();
  }

  String? _leadCreationDetails;
  String? get leadCreationDetails => _leadCreationDetails;

  Future<bool> createLead(Map<String, dynamic> data) async {
    try {
      LeadsCreationResponse? leadsCreationResponse =
          await apiRepository.createLead(data);
      if ((leadsCreationResponse?.data) != null) {
        _leadCreationDetails = leadsCreationResponse?.data?.name ?? "";
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      _errormsg = e.toString();
      if (kDebugMode) {
        print("error: ${e.toString()}");
      }
      notifyListeners();

      return false;
    }
  }

  /*
  * leads address creation api call
  * */

  Future<bool> createLeadAddress(Map<String, dynamic> data) async {
    try {
      CreateAddressResponse? leadsCategoryDetailsResponse =
          await apiRepository.createAddress(data: data);
      if ((leadsCategoryDetailsResponse) != null) {
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      _errormsg = e.toString();
      if (kDebugMode) {
        print("error: ${e.toString()}");
      }
      notifyListeners();
      return false;
    }
  }

  //own leads

  /*
  * get own leads list api call
  * */

  LeadsListOwnResponse? _leadsListOwnResponse;
  LeadsListOwnResponse? get leadsListOwnResponse => _leadsListOwnResponse;

  Future<bool> getLeadsListOwnApi(int page,
      {String? fromdate, String? todate, String? searchTerm}) async {
    try {
      LeadsListOwnResponse? leadsListOwnResponse =
          await apiRepository.getLeadsListOwn(page,
              fromdate: fromdate, todate: todate, searchTerm: searchTerm);
      if ((leadsListOwnResponse?.data ?? []).isNotEmpty) {
        _leadsListOwnResponse = leadsListOwnResponse;
        notifyListeners();
        return true;
      }
      _leadsListOwnResponse = null;
      notifyListeners();
      return false;
    } catch (e) {
      _errormsg = e.toString();
      if (kDebugMode) {
        print("error: ${e.toString()}");
      }
      notifyListeners();

      return false;
    }
  }

  List<LeadsListOwnList>? _leadsListOwnList = [];
  List<LeadsListOwnList>? get leadsListOwnList => _leadsListOwnList;
  bool _isLoadingleadsListOwnPagination = false;
  bool get isLoadingleadsListOwnPagination => _isLoadingleadsListOwnPagination;
  int _leadsListOwnCurrentPage = 0;
  bool _reachedLastPageleadsListOwn = false;
  bool get reachedLastPageleadsListOwn => _reachedLastPageleadsListOwn;

  Future<void> getLeadsListOwn({String? searchTerm}) async {
    if (_isLoadingleadsListOwnPagination || _reachedLastPageleadsListOwn) {
      return;
    }
    _isLoadingleadsListOwnPagination = true;
    await getLeadsListOwnApi(_leadsListOwnCurrentPage,
        fromdate: fromdate, todate: todate, searchTerm: searchTerm);
    final apiResponse = leadsListOwnResponse;
    final apiPosts = apiResponse?.data ?? [];
    if (apiPosts.length < 10) {
      _reachedLastPageleadsListOwn = true;
    }
    if (apiResponse != null) {
      if (apiPosts.isNotEmpty) {
        _leadsListOwnList?.addAll(apiPosts);
      }
      _leadsListOwnCurrentPage++;
    }
    _isLoadingleadsListOwnPagination = false;
    if ((leadsListOwnList ?? []).isNotEmpty) {
      notifyListeners();
    }
  }

  void resetleadsListOwnPagination() {
    _leadsListOwnList = [];
    _leadsListOwnCurrentPage = 0;
    _isLoadingleadsListOwnPagination = false;
    _reachedLastPageleadsListOwn = false;
    notifyListeners();
  }

  //

  //other leads

  /*
  * get other leads list api call
  * */

  LeadsListOwnResponse? _leadsListOtherResponse;
  LeadsListOwnResponse? get leadsListOtherResponse => _leadsListOtherResponse;

  Future<bool> getLeadsListOtherApi(int page, String uderID,
      {String? fromdate, String? todate, String? searchTerm}) async {
    try {
      LeadsListOwnResponse? leadsListOtherResponse =
          await apiRepository.getLeadsListOther(page, uderID,
              fromdate: fromdate, todate: todate, searchTerm: searchTerm);
      if ((leadsListOtherResponse?.data ?? []).isNotEmpty) {
        notifyListeners();
        _leadsListOtherResponse = leadsListOtherResponse;
        return true;
      }
      _leadsListOtherResponse = null;
      notifyListeners();
      return false;
    } catch (e) {
      _errormsg = e.toString();
      if (kDebugMode) {
        print("error: ${e.toString()}");
      }
      notifyListeners();

      return false;
    }
  }

  List<LeadsListOwnList>? _leadsListOtherList = [];
  List<LeadsListOwnList>? get leadsListOtherList => _leadsListOtherList;
  bool _isLoadingleadsListOtherPagination = false;
  bool get isLoadingleadsListOtherPagination =>
      _isLoadingleadsListOtherPagination;
  int _leadsListOtherCurrentPage = 0;
  bool _reachedLastPageleadsListOther = false;
  bool get reachedLastPageleadsListOther => _reachedLastPageleadsListOther;

  Future<void> getLeadsListOther(
      {String? searchTerm, required String uderID}) async {
    if (_isLoadingleadsListOtherPagination || _reachedLastPageleadsListOther) {
      return;
    }
    _isLoadingleadsListOtherPagination = true;
    notifyListeners();
    await getLeadsListOtherApi(_leadsListOtherCurrentPage, uderID,
        fromdate: fromdate, todate: todate, searchTerm: searchTerm);
    final apiResponse = leadsListOtherResponse;
    final apiPosts = apiResponse?.data ?? [];
    if (apiPosts.length < 10) {
      _reachedLastPageleadsListOther = true;
    }
    if (apiResponse != null) {
      if (apiPosts.isNotEmpty) {
        _leadsListOtherList?.addAll(apiPosts);
      }
      _leadsListOtherCurrentPage++;
    }
    _isLoadingleadsListOtherPagination = false;
    if ((leadsListOtherList ?? []).isNotEmpty) {
      notifyListeners();
    }
  }

  void resetleadsListOtherPagination() {
    _leadsListOtherList = [];
    _leadsListOtherCurrentPage = 0;
    _isLoadingleadsListOtherPagination = false;
    _reachedLastPageleadsListOther = false;
    notifyListeners();
  }

  List<QuotationLeadData>? quotationLead;

  Future<bool> getQuotationLead({String? leadId}) async {
    try {
      setLoader(true);
      notifyListeners();

      Map<String, dynamic>? param = {};

      param = {
        "filters": jsonEncode({
          "party_name": leadId,
        }),
      };

      GetQuotationLeadResponse? response =
          await apiRepository.getQuotationLead(param: param);

      if (response?.data != null) {
        quotationLead = response?.data;
        setLoader(false);
        notifyListeners();
        return true;
      }

      setLoader(false);
      notifyListeners();
      return false;
    } catch (e) {
      _errormsg = e.toString();
      setLoader(false);
      notifyListeners();
      return false;
    }
  }

  List<QuotationLeadFile>? quotationLeadFile;

  Future<bool> getQuotationFile({String? quotationId}) async {
    try {
      Map<String, dynamic>? param = {};

      param = {
        "filters": jsonEncode({
          "attached_to_doctype": "Quotation",
          "attached_to_name": quotationId,
        }),
        "fields": jsonEncode([
          "file_url",
        ]),
      };

      QuotationFileResponse? response =
          await apiRepository.getQuotationFile(param: param);

      if (response?.data != null) {
        quotationLeadFile = response?.data;
        return true;
      }

      return false;
    } catch (e) {
      _errormsg = e.toString();
      notifyListeners();
      return false;
    }
  }

  File? _file;
  File? get file => _file;

  Future<bool> getQuotation({String? quotationPath}) async {
    setLoader(true);
    try {
      // Call the API to get the quotation bytes
      http.Response res = await apiRepository.getQuotation(quotationPath);
      dynamic getQuotationData = res.bodyBytes;

      if (getQuotationData != null) {
        // Get the appropriate directory based on the platform
        final Directory? appDir = Platform.isAndroid
            ? await getExternalStorageDirectory()
            : await getApplicationDocumentsDirectory();

        if (appDir == null) {
          throw Exception("Unable to find the directory to save the file.");
        }

        // Ensure the directory exists
        if (!await appDir.exists()) {
          await appDir.create(recursive: true);
        }

        // Generate the file path and name
        String tempPath = appDir.path;
        final String fileName = path.basename(quotationPath!);
        final String fullPath =
            path.join(tempPath, fileName); // Safely join paths

        log('Saving file to: $fullPath');
        File file = File(fullPath);

        // Create the file if it doesn't exist
        if (!await file.exists()) {
          await file.create();
        }

        // Write the bytes to the file
        await file.writeAsBytes(getQuotationData);
        _file = file;

        log("File saved at: ${file.path}");
        setLoader(false);
        notifyListeners();
        return true;
      }

      setLoader(false);
      return false;
    } catch (e) {
      _errormsg = e.toString();
      print("Exception: ${e.toString()}");
      notifyListeners();
      return false;
    }
  }

  /*
  * assign employee api call
  * */

  List<ServerMessage>? serverMessage;

  Future<bool> assignEmployeeLead({String? leadId, assignTo}) async {
    try {
      setLoader(true);
      notifyListeners();

      log("assignTo ------$assignTo");
      log("leadId ------$leadId");

      FormData formData = FormData.fromMap({
        'assign_to': jsonEncode([assignTo]),
        'description': "libiya",
        'doctype': "Lead",
        'name': leadId,
      });

      logFormData(formData);

      AssignEmployeeLeadResponse? response =
          await apiRepository.asignEmployeeLead(formData: formData);

      if (response?.messages != null) {
        serverMessage = response?.serverMessages;
        log("----------success");

        setLoader(false);
        notifyListeners();
        return true;
      } else {
        setLoader(false);
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errormsg = e.toString();
      log("----------$_errormsg");
      setLoader(false);
      notifyListeners();
      return false;
    }
  }

  // Helper function to log FormData content
  void logFormData(FormData formData) {
    formData.fields.forEach((element) {
      log("Field: ${element.key} = ${element.value}");
    });
  }
}
