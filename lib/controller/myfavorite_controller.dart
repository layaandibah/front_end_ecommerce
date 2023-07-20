import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/function/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/myfavorite.dart';

class MyFavoriteController extends GetxController {
  MyServices myServices = Get.find();
  MyFavoriteData itemsData = MyFavoriteData(Get.find());
  StatusRequest? statusRequest;
  List data = [];

  getFavorite() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var res = await itemsData
        .getFavorite("${myServices.sharedPreferences.getInt("id")}");
    print("success res");
    print("${myServices.sharedPreferences.getInt("id")}");
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res["status"] == "success") {
        data.addAll(res["data"]);
        print(data);
      } else {
        statusRequest = StatusRequest.nodata;
      }
    } else {
      print("fail res");
    }
    update();
  }

  removeFavorite(String itemsid) async {
    await itemsData.removeFavorite(
        itemsid, "${myServices.sharedPreferences.getInt("id")}");
    data.removeWhere((element) {
      return element["items_id"].toString() == itemsid &&
          element["users_id"].toString() ==
              "${myServices.sharedPreferences.getInt("id")}";
    });

    print(data);

    Get.rawSnackbar(title: "67".tr, messageText: Text("65".tr));
    update();
  }

  @override
  void onInit() {
    getFavorite();
    super.onInit();
  }
}
