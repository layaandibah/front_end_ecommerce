import 'package:ecommers/controller/auth/forgetpassword_controller.dart';
import 'package:ecommers/core/class/handlingdataview.dart';
import 'package:ecommers/core/constant/color.dart';
import 'package:ecommers/core/function/validator.dart';
import 'package:ecommers/view/widget/auth/custombuttonauth.dart';
import 'package:ecommers/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommers/view/widget/auth/customtextformfaild.dart';
import 'package:ecommers/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.wightpurble,
          elevation: 0.0,
          title: Text(
            "19".tr,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18,
                  color: AppColor.gray,
                ),
          ),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
          init: ForgetPasswordControllerImp(),
          builder: (controller) {
            return HandlingDataView(
              statusrequest: controller.statusrequest,
              widget: Center(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        CustomTextTitleAuth(text: "28".tr),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextBodyAuth(text: "33".tr),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomTextFormFaild(
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            return valid(val!, 5, 40, "password");
                          },
                          titletext: "15".tr,
                          hinttext: "16".tr,
                          suffixicon: const Icon(Icons.email_outlined),
                          textEditingController: controller.email,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomButtonAuth(
                            onPressed: () {
                              controller.checkEmail();
                            },
                            text: "29".tr),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
