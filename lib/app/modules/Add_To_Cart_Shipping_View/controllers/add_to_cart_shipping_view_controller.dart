import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../main.dart';
import '../../../Modal/CartCountModel.dart';
import '../../../Modal/CartProductModel.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/SizeConstant.dart';

class AddToCartShippingViewController extends GetxController {
  RxBool hasData = false.obs;
  RxList<Details> cartProductList = RxList<Details>([]);
  CartProduct cartProduct = CartProduct();
  RxList<Count1> Countlist = RxList<Count1>([]);
  Count1 count1 = Count1();
  RxBool isLoading = false.obs;
  RxString selected1 = "add".obs;
  RxString selected2 = "add1".obs;
  RxString Gselected = "".obs;
  Rx<TextEditingController> couponController = TextEditingController().obs;
  @override
  void onInit() {
    super.onInit();
    CartProductApi();
    CartCount();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
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
      // respons = value as List;
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
        // isLoading.value = true;
        // CartProductApi();
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
}
