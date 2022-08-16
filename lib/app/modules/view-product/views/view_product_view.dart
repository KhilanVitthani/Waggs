import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/constant/Container.dart';
import 'package:waggs_app/app/modules/home/controllers/home_controller.dart';
import '../../../Modal/TopSellingStore.dart';
import '../controllers/view_product_controller.dart';

class ViewProductView extends GetWidget<ViewProductController> {
  // Products0 data;

  var dropdownItems;
  // ViewProductView(this.data);
  @override
  CarouselController carouselController = CarouselController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        // title: const Text('product View'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                  height: 250,
                  color: Colors.grey.shade200,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              height: 25,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "NEW",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              height: 25,
                              width: 80,
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
                                child: Text(
                                  "Save ${controller.data.discount!.toStringAsFixed(0)} %",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: CachedNetworkImage(
                                  imageUrl: controller.url == ''
                                      ? "${controller.data.images![0]}"
                                      : "${controller.url}",
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: imageProvider,
                                              colorFilter: ColorFilter.mode(
                                                  Colors.transparent,
                                                  BlendMode.colorBurn)),
                                        ),
                                      ),
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                        color: Colors.grey[100],
                                      ))),

                          // Image.network(width: 160,height:160,
                          //     "${data.images![0]}"),

                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 6.0, left: 6),
                                child: Text(
                                  "${controller.data.title}",
                                  style: TextStyle(
                                      color: Colors.lightBlueAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 6.0, left: 6, top: 10),
                                child: Text(
                                  "${controller.data.description}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6),
                                    child: RatingBarIndicator(
                                      rating:
                                          controller.data.rating!.toDouble(),
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 18.0,
                                      direction: Axis.horizontal,
                                    ),
                                  ),
                                  Text(
                                    controller.data.rating.toString(),
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Text(" | ${controller.data.ratedBy} Rating ",
                                      style: TextStyle(fontSize: 10)),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "\u{20B9}${controller.data.discountedPrice}.00",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      " - \u{20B9}",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    Text("${controller.data.price}.00",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 12,
                                            color: Colors.grey)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "You Save : \u{20B9}${controller.data.price! - controller.data.discountedPrice!}"
                                  "(${controller.data.discount!.toStringAsFixed(0)}%)",
                                  style: TextStyle(
                                      color: Colors.orange, fontSize: 12),
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    width: 350,
                    height: 110,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.data.images!.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.url.value =
                                      controller.data.images![index];
                                },
                                child: Container(
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(15),
                                    width: 100,
                                    height: 150,
                                    color: Colors.grey.shade300,
                                    child: Image.network(
                                        width: 100,
                                        height: 100,
                                        "${controller.data.images![index]}")),
                              )
                            ],
                          );
                        })),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: Text(
                        "Quantity",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.lightBlue.shade300,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 45,
                    margin: EdgeInsets.only(left: 15),
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                if (controller.count.value > 0) {
                                  controller.count.value--;
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, right: 5),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                  size: 22,
                                ),
                              )),
                        ),
                        Expanded(
                            child: Container(
                          height: 75,
                          width: 75,
                          padding:
                              EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                //                   <--- left side
                                color: Colors.grey,
                                width: 2.0,
                              ),
                              right: BorderSide(
                                //                    <--- top side
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            "${controller.count.value}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )),
                        )),
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                controller.count.value++;
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 22,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0, top: 15),
                          child: getcon(
                            text: Text(
                              "ADD TO CART",
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            color: Color(0xffDE8701),
                            width: 140,
                            height: 50,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, top: 15),
                          child: getcon(
                            text: Text(
                              "BUY NOW",
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            color: Colors.black,
                            width: 120,
                            height: 50,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 2, top: 8),
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                          ),
                          border: Border.all(
                            color: Colors.lightBlue.shade300,
                            width: 2,
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            size: 15,
                            color: Colors.blue.shade300,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 6, right: 6, top: 8),
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                          ),
                          border: Border.all(
                            color: Colors.lightBlue.shade300,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              Icons.share_outlined,
                              size: 17,
                              color: Colors.blue.shade300,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.isOpen.value = !controller.isOpen.value;
                    print(controller.isOpen.value);
                  },
                  child: Container(
                    margin: EdgeInsets.all(18),
                    padding: EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xffDE8701),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "key Featchers",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        controller.isOpen.value == false
                            ? Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.keyboard_arrow_up_sharp,
                                color: Colors.white,
                              )
                      ],
                    ),
                  ),
                ),
                controller.isOpen.value == false
                    ? Container()
                    : Container(
                        margin: EdgeInsets.only(left: 22),
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("BRAND :  ",
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        color: Colors.grey.shade600)),
                                Text("${controller.data.brand}",
                                    style: GoogleFonts.lato(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            controller.data.lifeStage == null
                                ? Container()
                                : Row(
                                    children: [
                                      Text("LIFE STAGE : ",
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              color: Colors.grey.shade600)),
                                      Text("${controller.data.lifeStage}",
                                          style: GoogleFonts.lato(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                            controller.data.productType == null
                                ? Container()
                                : SizedBox(
                                    height: 5,
                                  ),
                            controller.data.productType == null
                                ? Container()
                                : Row(
                                    children: [
                                      Text("PRODUCT TYPE :  ",
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              color: Colors.grey.shade600)),
                                      Text("${controller.data.productType}",
                                          style: GoogleFonts.lato(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                            controller.data.flavor == null
                                ? Container()
                                : SizedBox(
                                    height: 5,
                                  ),
                            controller.data.flavor == null
                                ? Container()
                                : Row(
                                    children: [
                                      Text("FLAVOUR  :  ",
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              color: Colors.grey.shade600)),
                                      Text("${controller.data.flavor}",
                                          style: GoogleFonts.lato(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                            controller.data.breedSize == null
                                ? Container()
                                : SizedBox(
                                    height: 5,
                                  ),
                            controller.data.breedSize == null
                                ? Container()
                                : Row(
                                    children: [
                                      Text("BREED SIZE  :  ",
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              color: Colors.grey.shade600)),
                                      Text("${controller.data.breedSize}",
                                          style: GoogleFonts.lato(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            controller.data.vegNonveg == null
                                ? Container()
                                : Row(
                                    children: [
                                      Text("VEG / NON VEG :  ",
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              color: Colors.grey.shade600)),
                                      Text("${controller.data.vegNonveg}",
                                          style: GoogleFonts.lato(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            controller.data.color == null
                                ? Container()
                                : Row(
                                    children: [
                                      Text("COLOR :  ",
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              color: Colors.grey.shade600)),
                                      Text("${controller.data.color}",
                                          style: GoogleFonts.lato(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                          ],
                        )),
                InkWell(
                  onTap: () {
                    controller.isOpen1.value = !controller.isOpen1.value;
                    print(controller.isOpen1.value);
                  },
                  child: Container(
                    margin: EdgeInsets.all(18),
                    padding: EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xffDE8701),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Seller Details",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        controller.isOpen1.value == false
                            ? Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.keyboard_arrow_up_sharp,
                                color: Colors.white,
                              )
                      ],
                    ),
                  ),
                ),
                controller.isOpen1.value == false
                    ? Container()
                    : Container(
                        margin: EdgeInsets.only(left: 22),
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${controller.data.sellerId!.companyName}",
                                style: GoogleFonts.lato(fontSize: 16)),
                            Text("${controller.data.sellerId!.address}",
                                style: GoogleFonts.lato(
                                    fontSize: 14, color: Colors.grey.shade600)),
                          ],
                        )),
                SizedBox(height: 30),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "- YOU MIGHT ALSO LIKE",
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                // Container(child: Text(controller.mainProductList[0].sellerId.toString())),
                GridView.builder(
                  itemCount: 100,
                  physics: NeverScrollableScrollPhysics()
                  ,shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  itemBuilder: (context, index) {
                    return Text(
                      index.toString(),
                      style: TextStyle(color: Colors.black),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
