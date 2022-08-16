import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/Modal/TopSellingStore.dart';

import '../controllers/product_all_controller.dart';

class ProductAllView extends GetView<ProductAllController> {
  RxList<Products0> TopProductlist;
  ProductAllView({required this.TopProductlist});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: () {
                  Get.back();
                }, icon: Icon(Icons.arrow_back)),
                Text(
                  "TOP SELLING PRODUCTS",
                  style: GoogleFonts.roboto(
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ],
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 670,
                    width: 400,
                    child: GridView.builder(
                        itemCount: TopProductlist.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 2,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: 170,
                                                      height: 140,
                                                      alignment: Alignment.center,
                                                      color: Colors.white,
                                                      margin: EdgeInsets.only(
                                                          top: 25, left: 10, right: 10),
                                                      child: CachedNetworkImage(
                                                          imageUrl:
                                                          "${TopProductlist[index].images![0]}",
                                                          imageBuilder: (context,
                                                              imageProvider) =>
                                                              Container(
                                                                decoration:
                                                                BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image:
                                                                      imageProvider,
                                                                      fit: BoxFit.cover,
                                                                      colorFilter:
                                                                      ColorFilter.mode(
                                                                          Colors
                                                                              .transparent,
                                                                          BlendMode
                                                                              .colorBurn)),
                                                                ),
                                                              ),
                                                          placeholder: (context, url) =>
                                                              CircularProgressIndicator(),
                                                          errorWidget: (context, url,
                                                              error) =>
                                                              Expanded(
                                                                  child: Container(
                                                                    color: Colors.grey[100],
                                                                  ))),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: double
                                                          .maxFinite,
                                                      height: 80,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets
                                                                .only(
                                                                left:
                                                                90),
                                                            height: 20,
                                                            width: 70,
                                                            decoration:
                                                            BoxDecoration(
                                                              color: Colors
                                                                  .red,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .only(
                                                                topLeft:
                                                                Radius.circular(20),
                                                                topRight:
                                                                Radius.circular(20),
                                                                bottomRight:
                                                                Radius.circular(20),
                                                                bottomLeft:
                                                                Radius.circular(20),
                                                              ),
                                                            ),
                                                            child:
                                                            Center(
                                                              child:
                                                              Text(
                                                                "Save ${TopProductlist[index].discount!.toStringAsFixed(2)} %",
                                                                style: TextStyle(
                                                                    color:
                                                                    Colors.white,
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 9),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        right: 30, ),
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${TopProductlist[index].sellerId!.companyName}",
                                            style: GoogleFonts.raleway(
                                                fontWeight:
                                                FontWeight.w700,
                                                fontSize: 13,
                                                color: Color.fromRGBO(
                                                    32, 193, 244, 1)),
                                          )),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 180,
                                      alignment: Alignment.center,
                                      margin:
                                      EdgeInsets.only(right: 25),
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${TopProductlist[index].category!.name} - ${TopProductlist[index].subCategory!.name} ",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey),
                                          )),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin:
                                          EdgeInsets.only(left: 10),
                                          child: Text(
                                            "₹${TopProductlist[index].price!.toStringAsFixed(2)}",
                                            style: GoogleFonts.roboto(
                                                decoration:
                                                TextDecoration
                                                    .lineThrough,
                                                color: Colors.grey,
                                                fontSize: 8),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Container(
                                          child: Text(
                                            "₹${TopProductlist[index].discountedPrice!.toStringAsFixed(2)}",
                                            style:
                                            TextStyle(fontSize: 10),
                                          ),
                                        ),
                                        RatingBarIndicator(
                                          rating: double.parse(
                                              TopProductlist[index]
                                                  .rating
                                                  .toString()),
                                          itemBuilder:
                                              (context, index) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 15.0,
                                          direction: Axis.horizontal,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        width: 150,
                                        height: 35,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.cyan,
                                          borderRadius:
                                          BorderRadius.only(
                                            topRight:
                                            Radius.circular(25),
                                            bottomRight:
                                            Radius.circular(25),
                                            bottomLeft:
                                            Radius.circular(25),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Icon(
                                                Icons.add_shopping_cart,
                                                color: Colors.white,
                                                size: 18),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "ADD TO CART",
                                              style:
                                              GoogleFonts.raleway(
                                                fontWeight:
                                                FontWeight.w700,
                                                fontSize: 13,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:0.59)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}