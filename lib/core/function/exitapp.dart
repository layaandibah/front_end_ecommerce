import 'dart:io';

import 'package:ecommers/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> exitDialog() {
  Get.defaultDialog(title: "51".tr, middleText: "48".tr, actions: [
    ElevatedButton(
        onPressed: () {
          Get.back();
        },
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(AppColor.primarycolor)),
        child: Text(
          "49".tr,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )),
    ElevatedButton(
        onPressed: () {
          exit(0);
        },
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(AppColor.primarycolor)),
        child: Text("50".tr)),
  ]);
  return Future.value(true);
}
