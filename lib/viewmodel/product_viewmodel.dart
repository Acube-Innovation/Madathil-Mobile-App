import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:madathil/model/model_class/api_response_model/create_check_out_response_model.dart';
import 'package:madathil/model/model_class/api_response_model/get__payment_method.dart';
import 'package:madathil/model/model_class/api_response_model/get_order_response.dart';
import 'package:madathil/model/model_class/api_response_model/product_detail_response.dart';
import 'package:madathil/model/model_class/api_response_model/product_list_model.dart';
import 'package:madathil/model/model_class/utility_model_class/cart_item_model.dart';
import 'package:madathil/model/services/api_service/api_repository.dart';
import 'package:madathil/utils/color/app_colors.dart';
import 'package:madathil/utils/color/util_functions.dart';
import 'package:madathil/view/screens/common_widgets/custom_buttons.dart';

class ProductViewmodel extends ChangeNotifier {
  final ApiRepository apiRepository;

  ProductViewmodel({required this.apiRepository});

  TextEditingController dobController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _errormsg;
  String? get errormsg => _errormsg;

  bool isLoading = true;
  setLoader(bool value) {
    isLoading = value;
    notifyListeners();
  }

  int tabindex = 0;
  setTabIndex(int? index) {
    tabindex = index!;
    log("tabindex:$tabindex");
    notifyListeners();
  }

  String? productSearchfn;

  DateTime? _start;
  DateTime? _end;

  DateTime? get start => _start;
  DateTime? get end => _end;
  String? startFormatted;
  String? endFormatted;

  void setDateRange(DateTime? start, DateTime? end) {
    _start = start;
    _end = end;
    startFormatted = DateFormat('yyyy-MM-dd').format(start!);
    endFormatted = DateFormat('yyyy-MM-dd').format(end!);
    dobController.text = "Start: $startFormatted  End: $endFormatted";

    notifyListeners();
  }

  void setSearchValue(String val) {
    productSearchfn = val;
    notifyListeners();
  }

  clearSearchVal() {
    productSearchfn = null;
    searchController.clear();
    notifyListeners();
  }

  clearamount() {
    amountController.clear();
  }

  /*
  * Product List api call
  * */

  ProductListResponse? _productListResponse;
  ProductListResponse? get productListResponse => _productListResponse;
  List<ProductList>? productList = [];

  Future<bool> getProductList({int? page, bool? isSolar}) async {
    try {
      setLoader(true);
      Map<String, dynamic>? param = {};
      if (isSolar == true) {
        if (startFormatted != null && endFormatted != null) {
          param = {
            "filters": jsonEncode({
              "business": "Solar",
              "creation": [
                "between",
                [startFormatted, endFormatted],
              ],
              "item_name": [
                "like",
                productSearchfn != null ? "$productSearchfn %" : "%"
              ]
            }),
            "limit_start": page! * 10,
            "limit": 10,
            "order_by": "modified desc"
          };
        } else {
          param = {
            "filters": jsonEncode({
              "business": "Solar",
              "item_name": [
                "like",
                productSearchfn != null ? "$productSearchfn %" : "%"
              ]
            }),
            "limit_start": page! * 10,
            "limit": 10,
            "order_by": "modified desc"
          };
        }
      } else {
        if (startFormatted != null && endFormatted != null) {
          param = {
            "filters": jsonEncode({
              "business": "Trading",
              "creation": [
                "between",
                [startFormatted, endFormatted]
              ],
              "item_name": [
                "like",
                productSearchfn != null ? "$productSearchfn %" : "%"
              ]
            }),
            "limit_start": page! * 10,
            "limit": 10,
            "order_by": "modified desc"
          };
        } else {
          param = {
            "filters": jsonEncode({
              "business": "Trading",
              "item_name": [
                "like",
                productSearchfn != null ? "$productSearchfn %" : "%"
              ]
            }),
            "limit_start": page! * 10,
            "limit": 10,
            "order_by": "modified desc"
          };
        }
      }

      ProductListResponse? response =
          await apiRepository.getProductList(param: param);
      if ((response?.message ?? []).isNotEmpty) {
        // _productListResponse = response;
        productList?.clear();
        productList = response?.message;

        log("produtct List------------> ${productList?.first.toJson() ?? []}");
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

  int productCurrentPage = 0;
  bool productReachLength = false;
  List<ProductList>? productPost = [];
  bool _paginationproduct = false;
  bool get ispaginationproduct => _paginationproduct;

  fetchProductList({bool? isSolarProduct}) async {
    if (_paginationproduct || productReachLength) {
      return;
    }
    _paginationproduct = true;

    await getProductList(page: productCurrentPage, isSolar: isSolarProduct);
    final apiResponse = productList;
    if (apiResponse != null) {
      final apiPosts = apiResponse;
      if (apiPosts.length < 10) {
        productReachLength = true;
      }
      productPost?.addAll(apiPosts);
      productCurrentPage++;
    }
    _paginationproduct = false;
    if ((productPost ?? []).isNotEmpty) {
      notifyListeners();
    }
  }

  void resetProductPagination() {
    productList?.clear();
    productPost?.clear();
    productCurrentPage = 0;
    _paginationproduct = false;
    productReachLength = false;
    notifyListeners();
  }

  void clearDateRange() {
    _start = null;
    _end = null;
    startFormatted = null;
    endFormatted = null;
    dobController.clear();
    notifyListeners();
  }
  /*
  *productDetail api call------------------------------------------------
  * */

  Product? productData;

  Future<bool> productDetail({String? itemName}) async {
    try {
      setLoader(true);

      ProductDetailResponse? response =
          await apiRepository.getProductDetail(param: {"item_name": itemName});
      if (response?.message != null) {
        // _productListResponse = response;
        productData = null;
        productData = response?.message;

        log("produtct detail------------> ${productData?.toJson() ?? []}");
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

  int _quantity = 0;

  int get quantity => _quantity;

  void increment() {
    _quantity++;
    notifyListeners();
  }

  void decrement() {
    if (_quantity > 0) {
      _quantity--;
      notifyListeners();
    }
  }
  /*
  *     createCheckOut api call------------------------------------------------
  * */

  SaleOrder? checkOutData;

  Future<bool> createCheckOut(
      {String? customer,
      String? date,
      Product? productData,
      List<CartItem>? cartItmes}) async {
    try {
      setLoader(true);
      List<Map<String, dynamic>> items = [];

      if (cartItmes != null && cartItmes.isNotEmpty) {
        for (var cartItem in cartItmes) {
          items.add({
            "item_code": cartItem.product?.itemCode,
            "qty": cartItem.quantity,
            "rate": cartItem.product?.rate?.toInt()
          });
        }
      } else if (productData != null) {
        // If no cartItems are provided, use the single product data
        items.add({
          "item_code": productData.itemCode,
          "qty": quantity, // Default to 1 if no quantity is provided
          "rate": productData.rate?.toInt()
        });
      }

      var response = await apiRepository.createCheckOut(data: {
        "customer": customer,
        "delivery_date": date,
        "items": items
        // "items": [
        //   {
        //     "item_code": productData?.itemCode,
        //     "qty": quantity,
        //     "rate": productData?.rate?.toInt()
        //   }
        // ]
      });
      if (response?.data?.doctype == "Sales Order") {
        checkOutData = response?.data;

        log("checkOut detail------------> ${checkOutData?.toJson() ?? []}");
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

  Future<bool> createPayment(
      {String? orderId, String? payment, String? txnId, int? amount}) async {
    try {
      setLoader(true);

      var response = await apiRepository.createPayment(data: {
        "sales_order_id": orderId,
        "payment_method": payment,
        "transaction_id": txnId,
        "amount": amount
      });
      if (UtilFunctions.checkAPIStatus(response!.message?.success)) {
        log(response.message?.message ?? "");

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

  List<PaymentMethod>? paymentMethod = [];

  Future<bool> getPaymentMethod(
      {String? orderId, String? payment, String? txnId, int? amount}) async {
    try {
      setLoader(true);

      var response = await apiRepository.getPaymentMethod(data: {
        "fields": jsonEncode(["name"]),
        "filters": jsonEncode({"enabled": 1}),
        "order_by": 'modified desc',
      });
      if ((response?.data ?? []).isNotEmpty ?? false) {
        paymentMethod = response?.data;
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

  String _selectedpayment = '';

  String get selectedpayment => _selectedpayment;
  void selectPayment(String value) {
    _selectedpayment = value;
    notifyListeners(); // Notify listeners when the value changes
  }
//cart funtions-----------------

  bool isCartCheckout = false;
  setCartCheckOut(bool val) {
    isCartCheckout = val;
  }

  List<CartItem> cartItmes = [];
  void addToCart({Product? product, int? quantity}) {
    final existingCartItemIndex =
        cartItmes.indexWhere((item) => item.product == product);

    if (existingCartItemIndex >= 0) {
      var currentQuantity = cartItmes[existingCartItemIndex].quantity ?? 0;
      cartItmes[existingCartItemIndex].quantity =
          currentQuantity + (quantity ?? 0);
    } else {
      cartItmes.add(CartItem(product: product, quantity: quantity));
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    cartItmes.removeWhere((item) => item.product == product);
    notifyListeners();
  }

  int getTotalQuantity() {
    return cartItmes.fold(0, (total, item) => total + item.quantity!);
  }

  clearCart() {
    cartItmes.clear();
    notifyListeners();
  }
}
