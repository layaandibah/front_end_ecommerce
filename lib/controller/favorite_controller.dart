import 'package:ecommers/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/function/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/favorite_data.dart';

class FavoriteController extends GetxController {
  Map isFavorite = {};
  MyServices myServices = Get.find();
  FavoriteData itemsData = FavoriteData(Get.find());
  StatusRequest? statusRequest;
  List data = [];
  late ItemsModel itemsModel;
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var res = await itemsData.addFavorite(
        itemsid, "${myServices.sharedPreferences.getInt("id")}");
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res["status"] == "success") {
        Get.rawSnackbar(title: "67".tr, messageText: Text("66".tr));
      }
    }
  }

  removeFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var res = await itemsData.removeFavorite(
        itemsid, "${myServices.sharedPreferences.getInt("id")}");
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res["status"] == "success") {
        Get.rawSnackbar(title: "67".tr, messageText: Text("65".tr));
      }
    }
    update();
  }

  goToProductDetiles(String itemId) {
    Get.toNamed(AppRoutes.productDetilesPage, arguments: {"item_Id": itemId});
  }
}
