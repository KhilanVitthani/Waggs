import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/SizeConstant.dart';
import '../controllers/view_all_my_cart_controller.dart';

class ViewAllMyCartView extends GetView<ViewAllMyCartController> {
  const ViewAllMyCartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(() => Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(onPressed: () {
              Get.back();
            }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
            actions: [
              IconButton(onPressed: () {

              }, icon: Icon(Icons.search,color: Colors.black,)),
              IconButton(onPressed: () {

              }, icon: Icon(Icons.shopping_cart_outlined,color: Colors.black,)),
            ],
          ),
          backgroundColor: Colors.white,
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.key,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {

                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      margin: EdgeInsets.only(left: 5,top: 0),
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          shape: BoxShape.circle,
                                      ),
                                      child: Icon(Icons.location_on_outlined,color: Colors.white,),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 25,right: 40),
                                          child: Text("STEP 1",
                                            style: GoogleFonts.raleway(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(32, 193, 244, 1),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5,top: 5),
                                          child: Text("DELIVERY ADDRESS",
                                            style: GoogleFonts.raleway(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.orange,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {

                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      margin: EdgeInsets.only(left: 5,top: 20),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(Icons.local_shipping_outlined,color: Colors.white,),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 5,top: 25,right: 25),
                                          child: Text("STEP 2",
                                            style: GoogleFonts.raleway(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(32, 193, 244, 1),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5,top: 5,right: 5),
                                          child: Text("SHIPPING",
                                            style: GoogleFonts.raleway(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {

                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      margin: EdgeInsets.only(left: 5,top: 20),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(Icons.payment,color: Colors.white,),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 10,top: 25,right: 30),
                                          child: Text("STEP 3",
                                            style: GoogleFonts.raleway(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(32, 193, 244, 1),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10,top: 5,right: 28),
                                          child: Text("PAYMENT",
                                            style: GoogleFonts.raleway(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.cartProductList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Expanded(flex: 1,
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.only(bottom: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1,color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    width: 120,
                                                    height: 120,
                                                    alignment: Alignment.center,
                                                    margin: EdgeInsets.only(top: 10,left: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey.shade200,
                                                        borderRadius: BorderRadius.all(Radius.circular(8))
                                                    ),
                                                    child: CachedNetworkImage(
                                                        imageUrl:
                                                        "${controller.cartProductList[index].product!.images![0]}",
                                                        imageBuilder: (context,
                                                            imageProvider) =>
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .all(10),
                                                              height: 70,
                                                              width: 70,
                                                              decoration:
                                                              BoxDecoration(
                                                                image: DecorationImage(
                                                                    image:
                                                                    imageProvider,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    colorFilter: ColorFilter.mode(
                                                                        Colors
                                                                            .transparent,
                                                                        BlendMode
                                                                            .colorBurn)),
                                                              ),
                                                            ),
                                                        placeholder: (context,
                                                            url) =>
                                                            CircularProgressIndicator(),
                                                        errorWidget: (context,
                                                            url, error) =>
                                                            Expanded(
                                                                child:
                                                                Container(
                                                                  color: Colors
                                                                      .grey[100],
                                                                ))),
                                                  ),
                                                  Positioned(
                                                    width: 20,
                                                      height: 20,
                                                      left: 110,
                                                      top: 6,
                                                      child: Container(
                                                        alignment: Alignment.center,
                                                        decoration: BoxDecoration(
                                                          color: Color.fromRGBO(32, 193, 244, 1),
                                                          shape: BoxShape.circle,
                                                        ),
                                                        child: Text("${controller.cartProductList[index].quantity}",style: GoogleFonts.raleway(fontSize: 12,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white,
                                                        ),),
                                                  ))
                                                ],
                                              )
                                            ],
                                          ),
                                          Expanded(
                                              child:
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                  left: 20.0,bottom: 10.0,top: 10),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "${controller.cartProductList[index].product!.title}",
                                                      style: TextStyle(
                                                        fontWeight:
                                                        FontWeight
                                                            .bold,
                                                        color: Color.fromRGBO(32, 193, 244, 1),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 20.0,bottom: 10.0),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "${controller.cartProductList[index].product!.description}",
                                                      style: TextStyle(
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 20.0),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "${controller.cartProductList[index].product!.weight} Kg",
                                                      style: TextStyle(
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ))
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Divider(
                                        indent: 3,
                                        color: Colors.grey.shade500,
                                        endIndent: 3,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              height: 34,
                                              margin: EdgeInsets.only(
                                                  left: 8),
                                              width:
                                              MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.3,
                                              padding: EdgeInsets.all(0),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                BorderRadius.only(
                                                  topLeft:
                                                  Radius.circular(20),
                                                  topRight:
                                                  Radius.circular(20),
                                                  bottomRight:
                                                  Radius.circular(20),
                                                  bottomLeft:
                                                  Radius.circular(20),
                                                ),
                                                border: Border.all(
                                                  color: Colors
                                                      .black54,
                                                  width: 1,
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: InkWell(
                                                        onTap: () {
                                                          controller
                                                              .UpdateCartRemove(
                                                            data: controller
                                                                .cartProductList[
                                                            index],
                                                          );
                                                        },
                                                        child: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              left:
                                                              8.0,
                                                              right:
                                                              5),
                                                          child: Icon(
                                                            Icons.remove,
                                                            color: Colors
                                                                .black,
                                                            size: 22,
                                                          ),
                                                        )),
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                        height: 75,
                                                        width: 75,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                            horizontal: 3,
                                                            vertical: 2),
                                                        decoration:
                                                        BoxDecoration(
                                                          border: Border(
                                                            left: BorderSide(
                                                              color: Colors
                                                                  .black54,
                                                              width: 1.0,
                                                            ),
                                                            right: BorderSide(
                                                              color: Colors
                                                                  .black54,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                            child: Text(
                                                              "${controller.cartProductList[index].quantity}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                            )),
                                                      )),
                                                  Expanded(
                                                    child: InkWell(
                                                        onTap: () {
                                                          controller
                                                              .UpdateCartAdd(
                                                            data: controller
                                                                .cartProductList[
                                                            index],
                                                          );
                                                        },
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors
                                                              .black,
                                                          size: 22,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.all(8.0),
                                            child: Text(
                                              "\u{20B9}${controller.cartProductList[index].product!.discountedPrice! * controller.cartProductList[index].quantity!}.00",
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  fontWeight:
                                                  FontWeight.w800),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10,top: 10),
                                child: Text("CONTACT INFORMATION",
                                  style: GoogleFonts.raleway(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Container(
                              margin: EdgeInsets.only(left: 15, right: 15,top: 10,),
                              padding: EdgeInsets.only(
                                left: 15
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
                                controller: controller.emailController.value,
                                validator: (input) => !isNullEmptyOrFalse(input)
                                    ? null
                                    : "Please Enter Password",
                                obscureText: controller.emailVisible.value,
                                decoration: InputDecoration(
                                    hintText: "Enter Your Password",
                                    hintStyle: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          controller.emailVisible.toggle();
                                        },
                                        icon: (!controller.emailVisible.value)
                                            ? Icon(
                                          Icons.visibility_off,
                                          color: Colors.grey,
                                        )
                                            : Icon(
                                          Icons.visibility,
                                          color: Colors.grey,
                                        ))),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ))
    );
  }
}