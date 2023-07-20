import 'package:ecommers/core/constant/color.dart';
import 'package:ecommers/core/constant/routes.dart';
import 'package:ecommers/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SettingController extends GetxController {}

class SettingControllerImp extends SettingController {
  MyServices myServices = Get.find();
 late String email;
 late String name;
  logOut() {
    Get.defaultDialog(
      contentPadding:const EdgeInsets.symmetric(vertical: 20),
      title: "71".tr,
      middleText: "72".tr,
      actions: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColor.primarycolor)),
            margin:const EdgeInsets.symmetric(horizontal: 10),
            padding:const EdgeInsets.symmetric(horizontal: 5),
            height: 35,
            width: 90,
            child: Text("49".tr,
                style:const TextStyle(height: 0.0, color: AppColor.gray)),
          ),
        ),
        InkWell(
          onTap: () {
            myServices.sharedPreferences.clear();
            Get.offAllNamed(AppRoutes.login);
            update();
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColor.primarycolor,
            ),
            margin:const EdgeInsets.symmetric(horizontal: 10),
            padding:const EdgeInsets.symmetric(horizontal: 5),
            height: 35,
            width: 90,
            child: Text(
              "50".tr,
              style:const TextStyle(
                  color: AppColor.wightpurble,
                  height: 0.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
  @override
  void onInit() {
   email=myServices.sharedPreferences.getString("user_email")!;
   name=myServices.sharedPreferences.getString("user_name")!;
    super.onInit();
  }
}
