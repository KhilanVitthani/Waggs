import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/modules/home/controllers/home_controller.dart';
import 'package:waggs_app/app/routes/app_pages.dart';

import '../../../Modal/CategoryModel.dart';

class CatagoryPageView extends GetWidget<HomeController> {
  CategoryData data;
  CatagoryPageView(this.data);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(onPressed: () {
                              Get.toNamed(Routes.HOME);
                            }, icon: Icon(Icons.keyboard_backspace_outlined))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(width: 200,),
                            IconButton(onPressed: () {
                            }, icon: Icon(Icons.search,size: 25,color: Colors.grey,)),
                            IconButton(onPressed: () {

                            }, icon: Icon(Icons.add_shopping_cart_outlined,size: 25,color: Colors.grey,)),
                            SizedBox(width: 8,),
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Stack(
                        children: [
                          Container(
                            height: 180,
                            padding: EdgeInsets.all(100),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/catagory.jpg"),
                                     fit: BoxFit.fill
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20,right: 20),
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/ca.png"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 45,left: 30),
                                child: Text(data.name.toString(),
                                  style: GoogleFonts.roboto(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffeb9d4f)
                                  )
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            margin: EdgeInsets.only(left: 20,right: 20),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/category01.jpg"),
                                fit: BoxFit.fill
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 120,
                                height: 38,
                                margin: EdgeInsets.only(top: 60,right: 40),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xffeb9d4f),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {

                                  },
                                  child: Text("DRY FOOD",
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            margin: EdgeInsets.only(left: 20,right: 20),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/category02.jpg"),
                                    fit: BoxFit.fill
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 120,
                                height: 38,
                                margin: EdgeInsets.only(top: 60,right: 40),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xffeb9d4f),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {

                                  },
                                  child: Text("WET FOOD",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            margin: EdgeInsets.only(left: 20,right: 20),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/category03.jpg"),
                                    fit: BoxFit.fill
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 120,
                                height: 38,
                                margin: EdgeInsets.only(left: 30,top: 80,right: 40),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xffeb9d4f),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {

                                  },
                                  child: Text("GRAIN FREE",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            margin: EdgeInsets.only(left: 20,right: 20),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/category04.jpg"),
                                    fit: BoxFit.fill
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 200,
                                height: 38,
                                margin: EdgeInsets.only(left: 30,top: 80,right: 40),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xffeb9d4f),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {

                                  },
                                  child: Text("WEIGHT MANAGEMENT",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            margin: EdgeInsets.only(left: 20,right: 20),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/category05.jpg"),
                                    fit: BoxFit.fill
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 200,
                                height: 38,
                                margin: EdgeInsets.only(left: 30,top: 80,right: 40),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xffeb9d4f),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {

                                  },
                                  child: Text("HEALTHCARE AIDS",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}