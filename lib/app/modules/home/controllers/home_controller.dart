import 'dart:convert';
import 'package:get/get.dart';
import 'package:waggs_app/app/Modal/bannerAllProductModel.dart';
import 'package:waggs_app/app/constant/sizeConstant.dart';
import '../../../Modal/GetAllProductModule.dart';
import '../../../constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //TODO: Implement HomeController
  GetAllproduct getAllproduct = GetAllproduct();
  models bannerProduct = models();
  var Bannerlist = <models>[].obs;
  List Category = ["Accessories +","Food +","Health & Wellness +","Treats And Chews +"];
  List categoryId = ["61e5662d2889b6b4933fa360","61d694038a92fef95dc20be1","61db117c5f39b415fbe32f01","61db0f775f39b415fbe32ee2"];
  var UserList = <Products>[].obs;
  @override
  void onInit() {
    getAllUserApi();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getAllUserApi() async {
    var url = Uri.parse(baseuel1 + ApiConstant.getAllProductUsers);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic result = jsonDecode(response.body);
    getAllproduct =  GetAllproduct.fromJson(result);
    if(!isNullEmptyOrFalse(getAllproduct.data)){
      if(!isNullEmptyOrFalse(getAllproduct.data!.products)){
        getAllproduct.data!.products!.forEach((element) {

          UserList.add(element);

        });
      }
    }

  }

  bannerUserApi() async {
    var url = Uri.parse(baserl2 + ApiConstant.bannerProductUsers);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic result = jsonDecode(response.body);
    models.fromJson(result);

  }
}
