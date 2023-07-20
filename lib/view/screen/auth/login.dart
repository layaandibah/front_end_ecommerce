import 'package:ecommers/controller/auth/login_controller.dart';
import 'package:ecommers/controller/password_controller.dart';
import 'package:ecommers/core/class/handlingdataview.dart';
import 'package:ecommers/core/constant/color.dart';
import 'package:ecommers/core/function/exitapp.dart';
import 'package:ecommers/core/function/validator.dart';
import 'package:ecommers/view/widget/auth/custombuttomntextauth.dart';
import 'package:ecommers/view/widget/auth/custombuttonauth.dart';
import 'package:ecommers/view/widget/auth/customlogoauth.dart';
import 'package:ecommers/view/widget/auth/custompassword.dart';
import 'package:ecommers/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommers/view/widget/auth/customtextformfaild.dart';
import 'package:ecommers/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.wightpurble,
          elevation: 0.0,
          title: Text(
            "12".tr,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18,
                  color: AppColor.gray,
                ),
          ),
        ),
        body: WillPopScope(
            onWillPop: exitDialog,
            child: GetBuilder<LogInControllerImp>(
              init: LogInControllerImp(),
              builder: (controller) {
                return HandlingDataView(
                  statusrequest: controller.statusrequest,
                  widget: Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      child: Form(
                        key: controller.formState,
                        child: ListView(
                          children: [
                            const CustomLogoAuth(),
                            CustomTextTitleAuth(text: "13".tr),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextBodyAuth(text: "14".tr),
                            const SizedBox(
                              height: 50,
                            ),
                            CustomTextFormFaild(
                              validator: (val) {
                                return valid(val!, 5, 100, "email");
                              },
                              keyboardType: TextInputType.emailAddress,
                              titletext: "15".tr,
                              hinttext: "16".tr,
                              suffixicon: const Icon(Icons.email_outlined),
                              textEditingController: controller.email,
                            ),
                            GetBuilder(
                                init: PasswordControllerImp(),
                                builder: (control) {
                                  return CustomPassword(
                                    validator: (val) {
                                      return valid(val!, 5, 50, "password");
                                    },
                                    passwordanable: control.password3,
                                    titletext: "17".tr,
                                    hinttext: "18".tr,
                                    textEditingController: controller.password,
                                    onPressed: () {
                                      control.changePass3Enable();
                                      print(control.password3);
                                    },
                                  );
                                }),
                            InkWell(
                              onTap: () {
                                Get.toNamed(controller.goToForgetPassword());
                              },
                              child: Text(
                                "19".tr,
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.end,
                              ),
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            CustomButtonAuth(
                                onPressed: () {
                                  controller.login();
                                },
                                text: "12".tr),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomBottomTextAuth(
                              questiontext: "20".tr,
                              auth: "21".tr,
                              onPressed: () {
                                controller.goToSignUp();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )));
  }
}
