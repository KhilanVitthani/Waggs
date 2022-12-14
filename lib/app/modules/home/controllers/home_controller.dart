import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:waggs_app/app/Modal/CartCountModel.dart';
import 'package:waggs_app/app/Modal/CartProductModel.dart';
import 'package:waggs_app/app/Modal/CategoryModel.dart';
import 'package:waggs_app/app/Modal/OrderModel.dart';
import 'package:waggs_app/app/Modal/SubCategoryModel.dart';
import 'package:waggs_app/app/Modal/TopSellingStore.dart';
import 'package:waggs_app/app/constant/sizeConstant.dart';
import 'package:waggs_app/app/routes/app_pages.dart';
import '../../../../main.dart';
import '../../../Modal/GetAllProductModule.dart';
import '../../../Modal/bannerAllProductModel.dart';
import '../../../constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var scaffoldKey = GlobalKey<ScaffoldState>();

  GetAllproduct getAllproduct = GetAllproduct();
  CategoryModel categoryModel = CategoryModel();
  bannerModels bannerModel = bannerModels();
  StoreModule storeModule = StoreModule();
  Count1 count1 = Count1();
  RxBool hasData = false.obs;
  RxBool hastopproduct = false.obs;
  RxBool isLoading = false.obs;
  CartProduct cartProduct = CartProduct();
  SubCategorymodel subCategorymodel = SubCategorymodel();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  RxList<Products> mainProductList = RxList<Products>([]);
  RxList<Details> cartProductList = RxList<Details>([]);
  RxList<Products> productList = RxList<Products>([]);
  RxList<CategoryData> CatagoryList = RxList<CategoryData>([]);
  RxList<SubCategoryData> SubCatagoryList = RxList<SubCategoryData>([]);
  RxList<SubCategoryData> subData = RxList<SubCategoryData>([]);
  RxList<BannerData> bannerList = RxList<BannerData>([]);
  TextEditingController searchController = TextEditingController();
  RxList<Products0> TopProductlist = RxList<Products0>([]);
  RxList<Sellers> SellersList = RxList<Sellers>([]);
  RxList<Count1> Countlist = RxList<Count1>([]);
  RxBool isFilterDrawer = false.obs;
  // final Rx<FocusNode> titleFocus = FocusNode().obs;
  List<String> imageList = [
    'assets/category01.jpg',
    'assets/category02.jpg',
    'assets/category03.jpg',
    'assets/category04.jpg',
    'assets/category05.jpg'
  ].obs;
  List respons = [];
  List respons1 = [];
  final count = 0.obs;
  RxBool isOpen = false.obs;
  RxBool isFromDrawer = false.obs;
  RxBool isOpen1 = false.obs;
  RxBool hasNotificationCount = false.obs;
  RxInt countNotification = 0.obs;
  RxString url = ''.obs;
  Orders1 orders1 = Orders1();
  RxList<Orders1> OrderList = RxList<Orders1>([]);
  RxList<Map<String, dynamic>> orderData = RxList<Map<String, dynamic>>([]);

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      bannerAllProduct();
      getNotificationCount();
      AllCategory();
      SubCategory();
      TopSellingStoreApi();
      TopSellingProductApi();
      CartCount();
      CartProductApi();
      super.onInit();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  AllCategory() async {
    var url = Uri.parse(baseUrl + ApiConstant.AllCategory);
    var response = await http.get(url);
    print('response status:${response.request}');
    dynamic result = jsonDecode(response.body);
    categoryModel = CategoryModel.fromJson(result);
    print(result);
    if (!isNullEmptyOrFalse(categoryModel.catagoryData)) {
      categoryModel.catagoryData!.forEach((element) {
        CatagoryList.add(element);
      });
      getAllUserApi();
    }
  }

  SubCategory() async {
    var url = Uri.parse(baseUrl + ApiConstant.AllSubCategory);
    var response = await http.get(url);
    print('response status:${response.request}');
    dynamic result = jsonDecode(response.body);
    subCategorymodel = SubCategorymodel.fromJson(result);
    print(result);
    if (!isNullEmptyOrFalse(subCategorymodel.data)) {
      subCategorymodel.data!.forEach((element) {
        SubCatagoryList.add(element);
      });
      getAllUserApi();
    }
  }

  getAllUserApi() async {
    var url = Uri.parse(baseUrl + ApiConstant.getAllProductUsers);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic result = jsonDecode(response.body);
    getAllproduct = GetAllproduct.fromJson(result);
    if (!isNullEmptyOrFalse(getAllproduct.data)) {
      if (!isNullEmptyOrFalse(getAllproduct.data!.products)) {
        getAllproduct.data!.products!.forEach((element) {
          mainProductList.add(element);
        });
        mainProductList.forEach((element) {
          if (element.category!.sId == CatagoryList[0].sId &&
              element.subCategory!.categoryId == CatagoryList[0].sId) {
            productList.add(element);
          }
        });
        productList.refresh();
      }
    }
  }

  bannerAllProduct() async {
    var url = Uri.parse(baseUrl + ApiConstant.bannerProductUsers);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic result = jsonDecode(response.body);
    bannerModel = bannerModels.fromJson(result);
    if (!isNullEmptyOrFalse(bannerModel.data)) {
      bannerModel.data!.forEach((element) {
        bannerList.add(element);
      });
      getAllUserApi();
    }
  }

  getNotificationCount() async {
    hasNotificationCount.value = false;
    var url = Uri.parse(baseUrl + ApiConstant.notificationCount);
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
      'Content-Type': 'application/json',
    });
    print('response status:${response.body}');
    hasNotificationCount.value = true;

    dynamic result = jsonDecode(response.body);
    Count1 count1 = Count1.fromJson(result);
    print(result);

    if (!isNullEmptyOrFalse(count1.data)) {
      countNotification.value = count1.data ?? 0;
    }
  }

  TopSellingStoreApi() async {
    var url = Uri.parse(baseUrl + ApiConstant.TopStore);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic result = jsonDecode(response.body);
    storeModule = StoreModule.fromJson(result);
    print(result);
    if (!isNullEmptyOrFalse(storeModule.data)) {
      if (!isNullEmptyOrFalse(storeModule.data!.sellers)) {
        storeModule.data!.sellers!.forEach((element) {
          SellersList.add(element);
        });
        getAllUserApi();
      }
    }
  }

  TopSellingProductApi() async {
    hastopproduct.value = false;
    var url = Uri.parse(baseUrl + ApiConstant.TopStore);
    var response;
    await http.get(url).then((value) async {
      dynamic result = jsonDecode(value.body);
      storeModule = StoreModule.fromJson(result);
      response = value;
      Position? currentPositionData = await getCurrentLocation();
      if (!isNullEmptyOrFalse(storeModule.data)) {
        if (!isNullEmptyOrFalse(storeModule.data!.products)) {
          storeModule.data!.products!.forEach((element) {
            if (!isNullEmptyOrFalse(element)) {
              if (!isNullEmptyOrFalse(element.sellerId)) {
                if (!isNullEmptyOrFalse(currentPositionData)) {
                  if (!isNullEmptyOrFalse(element.sellerId!.latitude) &&
                      !isNullEmptyOrFalse(element.sellerId!.longitude) &&
                      !isNullEmptyOrFalse(currentPositionData!.latitude) &&
                      !isNullEmptyOrFalse(currentPositionData.longitude)) {
                    double lat2 = element.sellerId!.latitude!;
                    double lat1 = currentPositionData.latitude;
                    double lon2 = element.sellerId!.longitude!;
                    double lon1 = currentPositionData.longitude;
                    print("lat1========${lat1}");
                    print("lon1========${lon1}");
                    print("lat2========${lat2}");
                    print("lon2========${lon2}");
                    var p = 0.017453292519943295;
                    var c = cos;
                    var a = 0.5 -
                        c((lat2 - lat1) * p) / 2 +
                        c(lat1 * p) *
                            c(lat2 * p) *
                            (1 - c((lon2 - lon1) * p)) /
                            2;
                    double distance = 12742 * asin(sqrt(a));
                    element.sellerId!.distance = distance;
                    print("My Distance := ${distance}");
                  }
                }
              }
            }
            TopProductlist.add(element);
            hastopproduct.value = true;
          });
          getAllUserApi();
        }
      }
    }).catchError((error) {
      hastopproduct.value = false;
    });
  }

  Future<void> addToCart({required Products0 data}) async {
    if ((box.read(ArgumentConstant.isUserLogin) == null)) {
      Get.toNamed(Routes.LOGIN_SCREEN);
    } else {
      print('Bearer ${box.read(ArgumentConstant.token)}');
      try {
        var url = Uri.parse(baseUrl + ApiConstant.Cart);
        var response;
        await http.post(url, body: {
          'productId': '${data.sId}',
        }, headers: {
          'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
        }).then((value) {
          response = value;
          CartProductApi();
          CartCount();
        });
        respons.add(response.body);
        print(jsonDecode(response.body).runtimeType);
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        if (response.statusCode == 200) {
          Get.snackbar("Success", "Product Successfully add to cart",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green);
        } else {
          Get.snackbar("Error", "Product already in cart",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.orangeAccent);
        }
      } catch (e) {
        Get.snackbar("Error", e.toString(),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.orangeAccent);
      }
    }
  }

  Future<void> CartDeleteApi({required Details data}) async {
    print('Bearer ${box.read(ArgumentConstant.token)}');
    print('${data.productId}');
    try {
      var headers = {
        'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
        'Content-Type': 'application/json'
      };
      var request = http.Request('PUT', Uri.parse(baseUrl + ApiConstant.Cart));
      request.body =
          json.encode({"productId": "${data.productId}", "quantity": 0});
      request.headers.addAll(headers);
      http.StreamedResponse? response;
      await request.send().then((value) {
        response = value;
        isLoading.value = true;
        CartProductApi();
        CartCount();
      });
      if (response!.statusCode == 200) {
        Get.snackbar("Success", "Product Remove From Your Cart ",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        print(response!.reasonPhrase);
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> UpdateCartAdd({required Details data}) async {
    print('Bearer ${box.read(ArgumentConstant.token)}');
    var count = data.quantity!;
    print('${data.productId}');
    try {
      var headers = {
        'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
        'Content-Type': 'application/json'
      };
      var request = http.Request('PUT', Uri.parse(baseUrl + ApiConstant.Cart));
      request.body = json
          .encode({"productId": "${data.productId}", "quantity": "${++count}"});
      request.headers.addAll(headers);
      http.StreamedResponse? response;
      await request.send().then((value) {
        response = value;
        // isLoading.value = true;
        // CartProductApi();
        CartCount();
      });

      if (response!.statusCode == 200) {
        cartProductList.forEach((element) {
          if (element.productId == data.productId) {
            element.quantity = element.quantity! + 1;
          }
        });
        cartProductList.refresh();
        Get.snackbar("Success", "Qunatity Updated",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        print(response!.reasonPhrase);
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> UpdateCartRemove({required Details data}) async {
    print('Bearer ${box.read(ArgumentConstant.token)}');
    var count = data.quantity!;
    print('${data.productId}');
    try {
      var headers = {
        'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
        'Content-Type': 'application/json'
      };
      var request = http.Request('PUT', Uri.parse(baseUrl + ApiConstant.Cart));
      request.body = json
          .encode({"productId": "${data.productId}", "quantity": "${--count}"});
      request.headers.addAll(headers);
      http.StreamedResponse? response;
      await request.send().then((value) {
        response = value;
        CartCount();
      });

      if (response!.statusCode == 200) {
        Get.snackbar("Success", "Qunatity Updated",
            snackPosition: SnackPosition.BOTTOM);
        cartProductList.forEach((element) {
          if (element.productId == data.productId) {
            element.quantity = element.quantity! - 1;
          }
        });
        cartProductList.refresh();
      } else {
        print(response!.reasonPhrase);
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  CartCount() async {
    Countlist.clear();
    var url = Uri.parse(baseUrl + ApiConstant.Count);
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
      'Content-Type': 'application/json',
    });
    print('response status:${response.body}');
    dynamic result = jsonDecode(response.body);
    count1 = Count1.fromJson(result);
    print(result);
    if (!isNullEmptyOrFalse(count1.data)) {
      Countlist.add(count1);
    }
    Countlist.refresh();
  }

  CartProductApi() async {
    hasData.value = false;
    cartProductList.clear();
    var url = await Uri.parse(baseUrl + ApiConstant.Cart);
    var response;
    await http.get(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    }).then((value) {
      hasData.value = true;
      print(value);
      response = value;
    }).catchError((error) {
      hasData.value = false;
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic result = jsonDecode(response.body);
    cartProduct = CartProduct.fromJson(result);
    print(result);
    if (!isNullEmptyOrFalse(cartProduct.data)) {
      if (!isNullEmptyOrFalse(cartProduct.data!.details)) {
        cartProduct.data!.details!.forEach((element) {
          cartProductList.add(element);
        });
      }
    }
    cartProductList.refresh();
  }

  Future<void> Allorder() async {
    var url = Uri.parse(baseUrl + ApiConstant.orderlist);
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    print('response status:${response.request}');
    dynamic result = jsonDecode(response.body);
    orders1 = Orders1.fromJson(result);
    print(result);
    if (!isNullEmptyOrFalse(orders1.data)) {
      OrderList.add(orders1);

      print(OrderList);

      if (!isNullEmptyOrFalse(OrderList)) {
        if (!isNullEmptyOrFalse(OrderList[0].data)) {
          if (!isNullEmptyOrFalse(OrderList[0].data!.orderDetails)) {
            OrderList[0].data!.orderDetails!.forEach((element) {
              Map<String, dynamic> dict = {};
              dict["GroupBy"] = element.orderNo! + "_" + element.createdAt!;
              dict["OrderData"] = element;
              print(element.createdAt!);
              orderData.add(dict);
            });
          }
        }
        print(orderData);
        Get.toNamed(Routes.ORDER_PAGE, arguments: {
          ArgumentConstant.orderData: orderData,
        });
      }
    } else {}
    OrderList.refresh();
  }
}
