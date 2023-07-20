import 'package:ecommers/controller/auth/signup_controller.dart';
import 'package:ecommers/controller/password_controller.dart';
import 'package:ecommers/core/class/handlingdataview.dart';
import 'package:ecommers/core/constant/color.dart';
import 'package:ecommers/core/function/exitapp.dart';
import 'package:ecommers/core/function/validator.dart';
import 'package:ecommers/view/widget/auth/custombuttomntextauth.dart';
import 'package:ecommers/view/widget/auth/custombuttonauth.dart';
import 'package:ecommers/view/widget/auth/custompassword.dart';
import 'package:ecommers/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommers/view/widget/auth/customtextformfaild.dart';
import 'package:ecommers/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  SignUpControllerImp controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.wightpurble,
          elevation: 0.0,
          title: Text(
            "21".tr,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18,
                  color: AppColor.gray,
                ),
          ),
        ),
        body: WillPopScope(
            onWillPop: exitDialog,
            child: Center(child: GetBuilder<SignUpControllerImp>(
              builder: (controller) {
                return HandlingDataView(
                  statusrequest: controller.statusrequest,
                  widget: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          CustomTextTitleAuth(text: "13".tr),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextBodyAuth(text: "26".tr),
                          const SizedBox(
                            height: 50,
                          ),
                          CustomTextFormFaild(
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              return valid(val!, 5, 100, "email");
                            },
                            titletext: "15".tr,
                            hinttext: "16".tr,
                            suffixicon: const Icon(Icons.email_outlined),
                            textEditingController: controller.email,
                          ),
                          CustomTextFormFaild(
                            keyboardType: TextInputType.text,
                            validator: (val) {
                              return valid(val!, 3, 40, "username");
                            },
                            titletext: "22".tr,
                            hinttext: "23".tr,
                            suffixicon: const Icon(Icons.person_outline),
                            textEditingController: controller.username,
                          ),
                          CustomTextFormFaild(
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              return valid(val!, 5, 20, "phone");
                            },
                            titletext: "24".tr,
                            hinttext: "25".tr,
                            suffixicon: const Icon(Icons.call_outlined),
                            textEditingController: controller.phone,
                          ),
                          GetBuilder(
                              init: PasswordControllerImp(),
                              builder: (control) {
                                return CustomPassword(
                                  validator: (val) {
                                    return valid(val!, 5, 50, "password");
                                  },
                                  passwordanable: control.password4,
                                  titletext: "17".tr,
                                  hinttext: "18".tr,
                                  textEditingController: controller.password,
                                  onPressed: () {
                                    control.changePass4Enable();
                                    print(control.password4);
                                  },
                                );
                              }),
                          const SizedBox(
                            height: 60,
                          ),
                          CustomButtonAuth(
                              onPressed: () async {
                                await controller.signup();
                              },
                              text: "21".tr),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomBottomTextAuth(
                            questiontext: "27".tr,
                            auth: "12".tr,
                            onPressed: () {
                              controller.goToSignIn();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ))));
  }
}
