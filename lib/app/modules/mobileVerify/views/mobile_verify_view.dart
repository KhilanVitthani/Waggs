import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/SizeConstant.dart';
import '../controllers/mobile_verify_controller.dart';

class MobileVerifyView extends GetWidget<MobileVerifyController> {
  const MobileVerifyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          body: Center(
            child: Form(
              key: controller.formKey2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/logo111.png", height: 100, width: 100),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "- Verify Mobile",
                    style: GoogleFonts.roboto(
                        color: Color.fromRGBO(242, 160, 87, 1),
                        height: 1.5,
                        fontSize: 24,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 15),
                          padding: EdgeInsets.only(
                            left: 15,
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
                            controller: controller.countryController.value,
                            keyboardType: TextInputType.phone,
                            validator: (input) => !isNullEmptyOrFalse(input)
                                ? null
                                : "Please Enter Your Country Code",
                            decoration: InputDecoration(
                              hintText: "+91",
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          padding: EdgeInsets.only(
                            left: 15,
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
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(
                                10,
                              ),
                            ],
                            controller: controller.mobileController.value,
                            validator: (input) => !isNullEmptyOrFalse(input)
                                ? null
                                : "Please Enter Your Phone Number",
                            decoration: InputDecoration(
                                hintText: "Enter Your Phone Number",
                                hintStyle: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorText: (controller.isNumberExist.isTrue)
                                    ? "Mobile number already registered"
                                    : null),
                            onChanged: (val) {
                              controller.isNumberExist.value = false;
                              if (val.length == 10) {
                                controller.verifyPhone(context);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () {
                      if (controller.formKey2.currentState!.validate()) {
                        if (controller.isNumberExist.isFalse) {
                          controller.sendOtp();
                        }
                      }
                    },
                    child: Container(
                      width: 180,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xffDE8701),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        ),
                      ),
                      child: Text(
                        "Send OTP",
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
