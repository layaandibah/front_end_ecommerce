import 'package:ecommers/controller/auth/verifycodesignupcontroller.dart';
import 'package:ecommers/core/class/handlingdataview.dart';
import 'package:ecommers/core/constant/color.dart';

import 'package:ecommers/view/widget/auth/customtextbodyauth.dart';

import 'package:ecommers/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.wightpurble,
        elevation: 0.0,
      ),
      body: Center(
          child: GetBuilder<VerifyCodeSignUpControllerImp>(
        init: VerifyCodeSignUpControllerImp(),
        builder: (controller) {
          return HandlingDataView(
            statusrequest: controller.statusrequest,
            widget: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: ListView(
                children: [
                  CustomTextTitleAuth(text: "32".tr),
                  CustomTextBodyAuth(text: "34".tr),
                  const SizedBox(
                    height: 50,
                  ),
                  OtpTextField(
                    borderRadius: BorderRadius.circular(10),
                    keyboardType: TextInputType.phone,
                    numberOfFields: 5,
                    borderColor: AppColor.primarycolor,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    fieldWidth: 45,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) async {
                      await controller.goToSuccessSignUp(verificationCode);
                    }, // end onSubmit
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
