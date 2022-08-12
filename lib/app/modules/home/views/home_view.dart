import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constant/SizeConstant.dart';
import '../../view-product/views/view_product_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
            body: Column(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 60,
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/logo111.png"),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 212,
                            margin: EdgeInsets.only(left: 15, right: 15),
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: TextFormField(
                              controller: controller.searchController,
                              validator: (input) => !isNullEmptyOrFalse(input)
                                  ? null
                                  : "Please Enter Your First Name",
                              decoration: InputDecoration(
                                hintText: "Search Product...",
                                hintStyle: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                                prefixIconColor: Colors.grey[200],
                                focusColor: Colors.grey,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.menu,
                                color: Colors.grey[500],
                              ))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      color: Colors.cyan,
                      child: Row(
                        children: List.generate(controller.CatagoryList.length,
                            (index) {
                          return Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    controller.CatagoryList.forEach((element) {
                                      element.isSelected!.value = false;
                                    });
                                    controller.CatagoryList[index].isSelected!
                                        .value = true;
                                    controller.CatagoryList[index].sId;
                                    print(
                                        "sId: ${controller.CatagoryList[index].sId}");
                                    controller.productList.clear();
                                    controller.mainProductList
                                        .forEach((element) {
                                      if (element.category!.sId ==
                                              controller
                                                  .CatagoryList[index].sId &&
                                          element.subCategory!.categoryId ==
                                              controller
                                                  .CatagoryList[index].sId) {
                                        controller.productList.add(element);
                                      }
                                    });
                                    controller.productList.refresh();
                                  },
                                  child: Text(
                                    "${controller.CatagoryList[index].name}+" +
                                        "",
                                    style: TextStyle(
                                        color: (controller.CatagoryList[index]
                                                .isSelected!.value)
                                            ? Colors.black
                                            : Colors.white),
                                  )),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(child: Image.asset("assets/poster.JPG"))
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "TOP SELLING STORES",
                            style: GoogleFonts.roboto(
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 23, bottom: 10),
                          child: Text(
                            "View All ",
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Column(
                        children: [
                          GridView.builder(
                              itemCount: controller.SellersList.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(ViewProductView(index));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 150,
                                              alignment: Alignment.center,
                                              color: Colors.grey[200],
                                              margin: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: CachedNetworkImage(
                                                imageUrl: "${controller.SellersList[index].logoUrl}",
                                                imageBuilder: (context, imageProvider) => Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover,
                                                        colorFilter:
                                                        ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                                                  ),
                                                ),
                                                placeholder: (context, url) => CircularProgressIndicator(),
                                                errorWidget: (context, url, error) => Icon(Icons.error),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                        width: 100,
                                        child: Text("${controller.SellersList[index].companyName}"),)
                                    ],
                                  ),
                                );
                              },
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, mainAxisSpacing: 50)),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "TOP SELLING PRODUCTS",
                            style: GoogleFonts.roboto(
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Column(
                        children: [
                          GridView.builder(
                              itemCount: controller.TopStorelist.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(ViewProductView(index));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Container(
                                                height: 150,
                                                alignment: Alignment.center,
                                                color: Colors.grey[200],
                                                margin: EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage("${controller.TopStorelist[index].images![0]}"),
                                                      fit: BoxFit.cover
                                                    ),

                                                  ),
                                                  child: Column(children: [
                                                    Container(
                                                      width: double.maxFinite,
                                                      height: 30,
                                                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets.all(1),
                                                            height: 20,
                                                            width: 70,
                                                            decoration: BoxDecoration(
                                                              color: Colors.red,
                                                              borderRadius: BorderRadius.only(
                                                                topLeft: Radius.circular(20),
                                                                topRight: Radius.circular(20),
                                                                bottomRight: Radius.circular(20),
                                                                bottomLeft: Radius.circular(20),
                                                              ),
                                                            ),
                                                            child: Center(
                                                              child: Text("Save ${controller.TopStorelist[index].discount!.toStringAsFixed(2)} %",
                                                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 9),),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],),
                                                ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, mainAxisSpacing: 50)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
      }),
    );
  }
}
