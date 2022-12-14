import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:waggs_app/app/constant/Container.dart';
import 'package:waggs_app/app/modules/cart_drawer/views/cart_drawer_view.dart';
import 'package:waggs_app/app/routes/app_pages.dart';

import '../../../../main.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/SizeConstant.dart';
import '../controllers/date_time_appoiment_controller.dart';

class DateTimeAppoimentView extends GetWidget<DateTimeAppoimentController> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  DateTimeAppoimentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAndToNamed(Routes.BOOK_APPOIMENT,
            arguments: controller.Argument[0]);
        return await true;
      },
      child: SafeArea(
          child: Scaffold(
        key: scaffoldKey,
        endDrawer: Drawer(
          child: CartDrawerView(),
        ),
        body: Container(
            child: Column(
          children: [
            Container(
              height: 60,
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.offAndToNamed(Routes.BOOK_APPOIMENT,
                                    arguments: controller.Argument[0]);
                              },
                              icon: Icon(Icons.keyboard_backspace_outlined))
                        ],
                      ),
                      Spacer(),
                      Stack(
                        children: [
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
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 180,
                      padding: EdgeInsets.all(100),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/catagory.jpg"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, right: 20),
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
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 60, left: 25),
                              child: Text("Book Appointment",
                                  style: GoogleFonts.roboto(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 5, left: 25),
                              child: Text("Home >",
                                  style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5, left: 2),
                              child: Text("My Pets >",
                                  style: GoogleFonts.roboto(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade600)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5, left: 2),
                              child: Text("Book Appointment",
                                  style: GoogleFonts.roboto(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade600)),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 0, left: 0),
                        child: Text("- SELECT TIME AND BOOK APPOINTMENT",
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        height: 280,
                        width: MediaQuery.of(context).size.width,
                        child: TabBarView(
                          controller: controller.tabController,
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              child: SfDateRangePicker(
                                selectionMode:
                                    DateRangePickerSelectionMode.single,
                                initialSelectedRange: PickerDateRange(
                                    DateTime.now()
                                        .subtract(const Duration(days: 4)),
                                    DateTime.now()
                                        .add(const Duration(days: 3))),
                                onSelectionChanged:
                                    (DateRangePickerSelectionChangedArgs args) {
                                  controller.date.value = args.value;
                                  print('Date==>${controller.date.value}');
                                },
                              ),
                            ),
                            Container(
                              child: TimePickerSpinner(
                                is24HourMode: false,
                                normalTextStyle:
                                    TextStyle(fontSize: 24, color: Colors.grey),
                                highlightedTextStyle: TextStyle(
                                    fontSize: 24, color: Colors.black),
                                spacing: 50,
                                itemHeight: 80,
                                isForce2Digits: true,
                                onTimeChange: (time) {
                                  controller.time.value = time;
                                  print('Time==>${controller.time.value}');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 45,
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              topLeft: Radius.circular(15)),
                        ),
                        child: TabBar(
                          controller: controller.tabController,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              15.0,
                            ),
                            color: Colors.cyan.shade400,
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(
                              icon: Icon(Icons.calendar_today),
                            ),
                            Tab(
                              icon: Icon(Icons.watch_later),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        margin: EdgeInsets.only(left: 15, right: 15),
                        padding: EdgeInsets.only(
                          left: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: TextFormField(
                          controller: controller.des,
                          keyboardType: TextInputType.text,
                          maxLines: 10,
                          validator: (val) {
                            if (isNullEmptyOrFalse(val)) {
                              return "Please enter breed";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Note for Vet',
                            labelStyle:
                                TextStyle(fontSize: 15, color: Colors.cyan),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {
                          controller.bookvet(context: context);
                        },
                        child: getcon(
                            color: Colors.orange,
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 50,
                            alignment: Alignment.center,
                            text: Text(
                              "BOOK APPOINMENT",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ))
          ],
        )),
      )),
    );
  }
}
