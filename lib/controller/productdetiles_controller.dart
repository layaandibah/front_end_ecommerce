import 'package:ecommers/controller/cart_controller.dart';
import 'package:ecommers/core/class/statusrequest.dart';
import 'package:ecommers/core/constant/color.dart';
import 'package:ecommers/core/services/services.dart';
import 'package:ecommers/data/datasource/remote/cart_data.dart';
import 'package:ecommers/data/datasource/remote/productdetiles_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/function/handlingdata.dart';

abstract class ProductDetilesController extends GetxController {}

class ProductDetilesControllerImp extends ProductDetilesController {
  StatusRequest? statusRequest;
  ProductDetilesData productDetilesData = ProductDetilesData(Get.find());
  String? itemId;
  Map item = {};
  var itemscount;
  var itemsdiscount = 0;
  var newprice = 0.0;
  var price = 0.0;
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  getItems(String itemId) async {
    statusRequest = StatusRequest.loading;
    var res = await productDetilesData.getData(itemId);
    print("success res");
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res["status"] == "success") {
        item.addAll(res["data"]);
        print("===============$item");
        itemsdiscount = await item["items_discount"];
        newprice = await item["itemspricediscount"];
        price = await item["items_price"];
        print(res["data"]["items_name"]);
      } else {
        statusRequest = StatusRequest.nodata;
      }
    } else {
      print("fail res");
    }
    update();
  }

  List itemColor = [
    {"name": "red", "id": 1, "active": 0},
    {"name": "yellow", "id": 2, "active": 0},
    {"name": "black", "id": 3, "active": 1}
  ];

  goToCart() {
    Get.delete<CartControllerImp>();
    Get.toNamed(AppRoutes.cartPage);
    update();
  }

  addCart(String itemsid, String count) async {
    // statusRequest = StatusRequest.loading;
    var res = await cartData.addCart(
        itemsid, "${myServices.sharedPreferences.getInt("id")}", count);
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res["status"] == "success") {
        Get.rawSnackbar(
            messageText: Text(
              "81".tr,
              style: const TextStyle(color: AppColor.wightpurble),
            ),
            duration: const Duration(milliseconds: 800));
      }
    }
    update();
  }

  deleteCart(String itemsid, String count) async {
    // statusRequest = StatusRequest.loading;
    var res = await cartData.removeCart(
        itemsid, "${myServices.sharedPreferences.getInt("id")}", count);
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res["status"] == "success") {
        Get.rawSnackbar(
            messageText: Text(
              "80".tr,
              style: const TextStyle(color: AppColor.wightpurble),
            ),
            duration: const Duration(milliseconds: 800));
      }
    }
    update();
  }

  getCount(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var res = await cartData.getCount(
        itemsid, "${myServices.sharedPreferences.getInt("id")}");
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res["status"] == "success") {
        return res["data"]["itemscount"];
      }
    }
    update();
  }

  initialData() async {
    itemId = Get.arguments["item_Id"];
    getItems(itemId!);
    itemscount = await getCount("$itemId");
    itemscount ??= 0;
    update();
  }

  add(String id) {
    if (itemscount < 10) {
      itemscount++;
      addCart(id, "$itemscount");
      update();
    }
  }

  delete(String id) {
    if (itemscount > 0) {
      itemscount--;
      deleteCart(id, "$itemscount");
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
