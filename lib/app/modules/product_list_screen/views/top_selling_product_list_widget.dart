import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/constant/Container.dart';
import 'package:waggs_app/app/constant/SizeConstant.dart';

import '../../../../main.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/productCard_const.dart';
import '../../../routes/app_pages.dart';
import '../../cart_drawer/views/cart_drawer_view.dart';
import '../controllers/product_list_screen_controller.dart';

class TopSellingProductListWidget extends StatefulWidget {
  ProductListScreenController controller;

  TopSellingProductListWidget({required this.controller});

  @override
  State<TopSellingProductListWidget> createState() =>
      _TopSellingProductListWidgetState();
}

class _TopSellingProductListWidgetState
    extends State<TopSellingProductListWidget> {
  ProductListScreenController controller = ProductListScreenController();

  @override
  void initState() {
    controller = widget.controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Obx(() {
        controller.Countlist.refresh();
        controller.cartProductList.refresh();
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            title: Text(
              "TOP SELLING PRODUCTS",
              style: GoogleFonts.roboto(
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            actions: [
              Stack(
                children: [
                  IconButton(
                      onPressed: () {
                        controller.isFilterDrawer.value = false;
                        scaffoldKey.currentState!.openEndDrawer();
                        controller.CartCount();
                        controller.CartProductApi();
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 25,
                        color: Colors.grey[500],
                      )),
                  (controller.count1.data == 0 ||
                          controller.count1.data == null)
                      ? Container()
                      : Positioned(
                          left: 22,
                          top: 2,
                          child: Container(
                            width: 18,
                            height: 18,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(32, 193, 244, 1),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "${controller.count1.data}",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
                ],
              )
            ],
          ),
          drawerEnableOpenDragGesture: false,
          endDrawer: GestureDetector(
            onHorizontalDragStart: (val) {},
            child: Drawer(
              width: 280,
              child: (controller.isFilterDrawer.isFalse)
                  ? CartDrawerView()
                  : Column(
                      children: [
                        Container(
                          height: 80,
                          child: DrawerHeader(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Filters",
                                  style: GoogleFonts.raleway(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.values4.value =
                                      RangeValues(100, 30000);
                                  controller.values1.value =
                                      RangeValues(0, 100);
                                  controller.radioGValues.value = "";
                                  controller.isOp2.value = false;
                                  controller.isOp.value = false;
                                  controller.subData.forEach((ele) {
                                    ele.fields!.forEach((element) {
                                      element.isExpanded!.value = false;
                                      element.isChecked!.forEach((element) {
                                        element = false;
                                      });
                                      element.isChecked!.refresh();
                                      element.isExpanded!.refresh();
                                      controller.refresh();
                                    });
                                  });

                                  controller.subData.clear();
                                  controller.AllCategory();
                                  controller.SubCategory();
                                },
                                child: Container(
                                  child: Text(
                                    "Clear All",
                                    style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(32, 193, 244, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    "Price",
                                    style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => RangeSlider(
                                    values: controller.values4.value,
                                    activeColor: Colors.lightBlue[300],
                                    inactiveColor: Colors.lightBlue[200],
                                    min: 100,
                                    max: 30000,
                                    divisions: 10000,
                                    labels: RangeLabels(
                                      "\u{20B9}${controller.values4.value.start.round().toString()}",
                                      "\u{20B9}${controller.values4.value.end.round().toString()}",
                                    ),
                                    onChanged: (RangeValues values) {
                                      controller.values4.value = values;
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "Discount",
                                    style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => RangeSlider(
                                    divisions: 100,
                                    activeColor: Colors.lightBlue[300],
                                    inactiveColor: Colors.lightBlue[200],
                                    min: 0,
                                    max: 100,
                                    values: controller.values1.value,
                                    labels: RangeLabels(
                                        "${controller.values1.value.start.round().toString()}%",
                                        "${controller.values1.value.end.round().toString()}%"),
                                    onChanged: (value) {
                                      controller.values1.value = value;
                                      print(
                                          'value=>${controller.values1.value}');
                                      print(
                                          '${RangeLabels(controller.values1.value.start.round().toString(), controller.values1.value.end.round().toString())}');
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.isOp.value =
                                        !controller.isOp.value;
                                    print(controller.isOp.value);
                                  },
                                  child: Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Text(
                                            "Category",
                                            style: GoogleFonts.raleway(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(right: 20),
                                            child: Obx(
                                              () =>
                                                  controller.isOp.value == false
                                                      ? Icon(
                                                          Icons
                                                              .keyboard_arrow_down_outlined,
                                                        )
                                                      : Icon(
                                                          Icons
                                                              .keyboard_arrow_up_sharp,
                                                        ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                Obx(() => controller.isOp.value == false
                                    ? Container()
                                    : Container(
                                        margin: EdgeInsets.only(left: 22),
                                        padding: EdgeInsets.all(5),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: controller
                                                    .CatagoryList.length,
                                                itemBuilder: (context, index) {
                                                  return Row(
                                                    children: [
                                                      Container(
                                                        child: Obx(() {
                                                          return Radio<String>(
                                                            activeColor:
                                                                Color.fromRGBO(
                                                                    32,
                                                                    193,
                                                                    244,
                                                                    1),
                                                            onChanged: (value) {
                                                              controller
                                                                      .radioGValues
                                                                      .value =
                                                                  value
                                                                      as String;
                                                              controller.radioGValues
                                                                          .value !=
                                                                      null
                                                                  ? controller
                                                                          .isOp2
                                                                          .value ==
                                                                      true
                                                                  : false;
                                                              controller.isOp2
                                                                  .value = true;
                                                              controller
                                                                  .SubCatagoryList[
                                                                      index]
                                                                  .sId;
                                                              print(
                                                                  "SID : ${controller.SubCatagoryList[index].sId}");
                                                              controller
                                                                      .sidValues
                                                                      .value =
                                                                  controller
                                                                      .CatagoryList[
                                                                          index]
                                                                      .sId!;
                                                              print(
                                                                  "Sidvalue==${controller.sidValues.value}");
                                                              controller.subData
                                                                  .clear();
                                                              controller
                                                                  .subDataIndex
                                                                  .value = 0;
                                                              controller
                                                                      .SubCatagoryList
                                                                  .forEach(
                                                                      (element) {
                                                                if (element
                                                                        .categoryId ==
                                                                    controller
                                                                        .CatagoryList[
                                                                            index]
                                                                        .sId) {
                                                                  controller
                                                                      .subData
                                                                      .add(
                                                                          element);
                                                                  print("Data" +
                                                                      element
                                                                          .name
                                                                          .toString());
                                                                } else {}
                                                              });
                                                              controller
                                                                  .radioGValues1
                                                                  .value = "";
                                                              controller
                                                                      .CategoriId =
                                                                  controller
                                                                      .CatagoryList[
                                                                          index]
                                                                      .sId
                                                                      .toString();
                                                            },
                                                            value: controller
                                                                .CatagoryList[
                                                                    index]
                                                                .name!,
                                                            groupValue:
                                                                controller
                                                                    .radioGValues
                                                                    .value,
                                                          );
                                                        }),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          "${controller.CatagoryList[index].name}",
                                                          style: GoogleFonts
                                                              .raleway(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                Obx(
                                  () => controller.isOp2.value == false
                                      ? Container()
                                      : InkWell(
                                          onTap: () {
                                            controller.isOp1.value =
                                                !controller.isOp1.value;
                                            print(controller.isOp1.value);
                                          },
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 20),
                                                  child: Text(
                                                    "SubCategory",
                                                    style: GoogleFonts.raleway(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        right: 20),
                                                    child: Obx(
                                                      () => controller.isOp1
                                                                  .value ==
                                                              false
                                                          ? Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_outlined,
                                                            )
                                                          : Icon(
                                                              Icons
                                                                  .keyboard_arrow_up_sharp,
                                                            ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                ),
                                Obx(() => controller.isOp1.value == false
                                    ? Container()
                                    : Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 22),
                                            padding: EdgeInsets.all(5),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: ListView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemCount: controller
                                                        .subData.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Row(
                                                        children: [
                                                          Container(
                                                            child: Obx(() {
                                                              return Radio<
                                                                  String>(
                                                                activeColor: Color
                                                                    .fromRGBO(
                                                                        32,
                                                                        193,
                                                                        244,
                                                                        1),
                                                                toggleable:
                                                                    true,
                                                                onChanged:
                                                                    (value) {
                                                                  // value = false;
                                                                  controller
                                                                          .radioGValues1
                                                                          .value =
                                                                      value
                                                                          as String;
                                                                  controller.radioGValues1
                                                                              .value !=
                                                                          ""
                                                                      ? controller
                                                                              .isOp3
                                                                              .value ==
                                                                          true
                                                                      : false;
                                                                  controller
                                                                          .isOp3
                                                                          .value =
                                                                      true;
                                                                  controller
                                                                      .SubCatagoryList[
                                                                          index]
                                                                      .sId;
                                                                  controller
                                                                      .subDataIndex
                                                                      .value = index;
                                                                  controller
                                                                      .productList
                                                                      .clear();
                                                                  controller
                                                                          .SubCategoriId =
                                                                      controller
                                                                          .subData[
                                                                              index]
                                                                          .sId
                                                                          .toString();
                                                                },
                                                                value: controller
                                                                    .subData[
                                                                        index]
                                                                    .name
                                                                    .toString(),
                                                                groupValue:
                                                                    controller
                                                                        .radioGValues1
                                                                        .value,
                                                              );
                                                            }),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              "${controller.subData[index].name}",
                                                              style: GoogleFonts
                                                                  .raleway(
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .black),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                controller.subData.isEmpty
                                    ? Container()
                                    : Container(
                                        margin: EdgeInsets.only(left: 10),
                                        padding: EdgeInsets.only(right: 10),
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: controller
                                              .subData[
                                                  controller.subDataIndex.value]
                                              .fields!
                                              .length,
                                          itemBuilder: (context, index) {
                                            return Obx(() => Column(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        controller
                                                            .subData[controller
                                                                .subDataIndex
                                                                .value]
                                                            .fields!
                                                            .forEach((element) {
                                                          element.isExpanded!
                                                              .value = false;
                                                        });
                                                        controller
                                                            .subData[controller
                                                                .subDataIndex
                                                                .value]
                                                            .fields![index]
                                                            .isExpanded!
                                                            .toggle();
                                                        controller
                                                            .subData[controller
                                                                .subDataIndex
                                                                .value]
                                                            .fields![index]
                                                            .isExpanded!
                                                            .refresh();
                                                      },
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 15,
                                                                      top: 15),
                                                              child: Text(
                                                                "${controller.subData[controller.subDataIndex.value].fields![index].id.toString()}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 15),
                                                              child: Icon((controller
                                                                      .subData[controller
                                                                          .subDataIndex
                                                                          .value]
                                                                      .fields![
                                                                          index]
                                                                      .isExpanded!
                                                                      .value)
                                                                  ? Icons
                                                                      .keyboard_arrow_up_outlined
                                                                  : Icons
                                                                      .keyboard_arrow_down_outlined),
                                                            )
                                                          ]),
                                                    ),
                                                    if (controller
                                                            .subData[controller
                                                                .subDataIndex
                                                                .value]
                                                            .fields![index]
                                                            .isExpanded!
                                                            .value ==
                                                        true)
                                                      Container(
                                                        child: ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount: controller
                                                                .subData[controller
                                                                    .subDataIndex
                                                                    .value]
                                                                .fields![index]
                                                                .values!
                                                                .length,
                                                            itemBuilder:
                                                                ((context,
                                                                    index1) {
                                                              return Obx(
                                                                  () => Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Checkbox(
                                                                              onChanged: (value) {
                                                                                controller.subData[controller.subDataIndex.value].fields![index].isChecked![index1] = value as bool;
                                                                                controller.subData[controller.subDataIndex.value].fields![index].isChecked!.refresh();
                                                                              },
                                                                              value: controller.subData[controller.subDataIndex.value].fields![index].isChecked![index1]),
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              margin: EdgeInsets.only(left: 15, top: 15),
                                                                              child: Text(
                                                                                "${controller.subData[controller.subDataIndex.value].fields![index].values![index1].toString()}",
                                                                                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ));
                                                            })),
                                                      ),
                                                  ],
                                                ));
                                          },
                                        )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 60,
                          child: InkWell(
                            onTap: () {
                              List reqList = [];
                              if (controller.subData.isEmpty) {
                                // controller.getProduct();
                              } else {
                                for (int i = 0;
                                    i <
                                        controller
                                            .subData[
                                                controller.subDataIndex.value]
                                            .fields!
                                            .length;
                                    i++) {
                                  if (!isNullEmptyOrFalse(controller
                                      .subData[controller.subDataIndex.value]
                                      .fields![i]
                                      .id)) {
                                    List data = [];
                                    data.add(controller
                                        .subData[controller.subDataIndex.value]
                                        .fields![i]
                                        .id);
                                    if (!isNullEmptyOrFalse(controller
                                        .subData[controller.subDataIndex.value]
                                        .fields![i]
                                        .values)) {
                                      List selectedValue = [];
                                      for (int j = 0;
                                          j <
                                              controller
                                                  .subData[controller
                                                      .subDataIndex.value]
                                                  .fields![i]
                                                  .values!
                                                  .length;
                                          j++) {
                                        if (controller
                                                .subData[controller
                                                    .subDataIndex.value]
                                                .fields![i]
                                                .isChecked![j] ==
                                            true) {
                                          selectedValue.add(controller
                                              .subData[
                                                  controller.subDataIndex.value]
                                              .fields![i]
                                              .values![j]);
                                        }
                                      }
                                      data.add(selectedValue);
                                    } else {
                                      data.add([]);
                                    }
                                    reqList.add(data);
                                  }
                                  print("Request List := ${reqList}");

                                  print(
                                      "${controller.subData[controller.subDataIndex.value].fields![i].values}==> ${controller.subData[controller.subDataIndex.value].fields![i].isChecked}");
                                }
                                controller.getFilterData(
                                    reqList: reqList, context: context);
                              }

                              controller.values4.value =
                                  RangeValues(100, 30000);
                              controller.values1.value = RangeValues(0, 100);
                              controller.radioGValues.value = "";
                              controller.isOp2.value = false;
                              controller.isOp.value = false;
                              controller.subData[controller.subDataIndex.value]
                                  .fields!
                                  .forEach((element) {
                                element.isChecked!.forEach((element) {
                                  element = false;
                                });
                                element.isChecked!.refresh();
                              });
                              controller.subData.clear();
                              controller.AllCategory();
                              controller.SubCategory();

                              scaffoldKey.currentState!.closeEndDrawer();
                              // Navigator.of(context).pop;
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(32, 193, 244, 1),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                ),
                              ),
                              child: Text(
                                "Apply",
                                style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          body: Obx(
            () => (controller.hastopproduct.isFalse)
                ? Center(child: CircularProgressIndicator())
                : (isNullEmptyOrFalse(controller.mainProductList))
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      if ((box.read(
                                              ArgumentConstant.isUserLogin) ==
                                          null)) {
                                        Get.toNamed(Routes.LOGIN_SCREEN);
                                      }
                                      controller.isFilterDrawer.value = false;
                                      scaffoldKey.currentState!.openEndDrawer();
                                    },
                                    icon: Icon(
                                      Icons.shopping_cart,
                                      size: 25,
                                      color: Colors.grey[500],
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          "Sort By: ",
                                          style: GoogleFonts.raleway(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      PopupMenuButton<int>(
                                        itemBuilder: (context) {
                                          return List.generate(
                                              controller.location.length,
                                              (index) => PopupMenuItem(
                                                    child: Text(controller
                                                        .location[index]),
                                                    onTap: () {
                                                      controller.price.value =
                                                          controller
                                                              .location[index];

                                                      controller.price
                                                          .refresh();
                                                    },
                                                  ));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              child: Text(
                                                "${controller.price.value}",
                                                style: GoogleFonts.raleway(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              child: Icon(
                                                Icons
                                                    .keyboard_arrow_down_outlined,
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              height: 300,
                              width: 250,
                              child: SvgPicture.asset("assets/NoData.svg"),
                            ),
                            Text(
                              "No data found",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Color.fromRGBO(33, 43, 54, 1)),
                            ),
                            Spacer(),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  controller.isFilterDrawer.value = true;
                                  ;
                                  scaffoldKey.currentState!.openEndDrawer();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        "Filters",
                                        style: GoogleFonts.raleway(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.filter_list,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "Sort By: ",
                                        style: GoogleFonts.raleway(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    PopupMenuButton<int>(
                                      itemBuilder: (context) {
                                        return List.generate(
                                            controller.location.length,
                                            (index) => PopupMenuItem(
                                                  child: Text(controller
                                                      .location[index]),
                                                  onTap: () {
                                                    if (index == 0) {
                                                      controller
                                                          .getFillterProduct(
                                                              sort:
                                                                  "newArrivals");
                                                    }
                                                    if (index == 1) {
                                                      controller
                                                          .getFillterProduct(
                                                              sort:
                                                                  "priceAsec");
                                                    }
                                                    if (index == 2) {
                                                      controller
                                                          .getFillterProduct(
                                                              sort:
                                                                  "priceDesc");
                                                    }
                                                    if (index == 3) {
                                                      controller
                                                          .getFillterProduct(
                                                              sort:
                                                                  "discountAsec");
                                                    }
                                                    if (index == 4) {
                                                      controller
                                                          .getFillterProduct(
                                                              sort:
                                                                  "discountDesc");
                                                    }
                                                    controller.price.value =
                                                        controller
                                                            .location[index];
                                                    controller.price.refresh();
                                                  },
                                                ));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            child: Text(
                                              "${controller.price.value}",
                                              style: GoogleFonts.raleway(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            child: Icon(
                                              Icons
                                                  .keyboard_arrow_down_outlined,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: MediaQuery.of(context).size.height * 0.37,
                              width: 400,
                              child: GridView.builder(
                                  itemCount: controller.mainProductList.length,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return productCard(
                                        onTap: () {
                                          Get.toNamed(Routes.VIEW_PRODUCT,
                                              arguments: controller
                                                  .mainProductList[index]);
                                        },
                                        image: controller
                                            .mainProductList[index].images![0],
                                        discount: controller
                                            .mainProductList[index].discount!
                                            .toStringAsFixed(0),
                                        companyName: controller
                                            .mainProductList[index].title,
                                        categoryName: controller
                                            .mainProductList[index]
                                            .category!
                                            .name,
                                        subCategoryName: controller
                                            .mainProductList[index]
                                            .subCategory!
                                            .name,
                                        price: controller.mainProductList[index].price
                                            .toString(),
                                        discountedPrice: controller
                                            .mainProductList[index]
                                            .discountedPrice
                                            .toString(),
                                        rating: controller.mainProductList[index].rating
                                            .toString(),
                                        ButtonText: "ADD TO CART",
                                        ButtonTap: () {
                                          print(
                                              "${controller.mainProductList[index].sId}");
                                          print(
                                              "Bearer ${box.read(ArgumentConstant.token)}");
                                          controller.addToCart(
                                              data: controller
                                                  .mainProductList[index]);
                                        },
                                        icon: Icons.add_shopping_cart,
                                        isShipping: (int.parse(controller.mainProductList[index].sellerId!.shippingLimit.toString()) >
                                                controller
                                                    .mainProductList[index]
                                                    .sellerId!
                                                    .distance)
                                            ? false
                                            : true);
                                  },
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: MediaQuery.of(context)
                                            .size
                                            .width /
                                        (MediaQuery.of(context).size.height /
                                            1.2),
                                  )),
                            ),
                          ),
                        ],
                      ),
          ),
        );
      }),
    );
  }
}
