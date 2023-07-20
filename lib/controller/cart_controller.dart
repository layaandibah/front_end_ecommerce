import 'package:ecommers/controller/productdetiles_controller.dart';
import 'package:ecommers/core/constant/color.dart';
import 'package:ecommers/data/datasource/remote/cart_data.dart';
import 'package:ecommers/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/function/handlingdata.dart';
import '../core/services/services.dart';

abstract class CartController extends GetxController {
  resetVarCart();
  refreshPage();
  getCart();
  addCart(String itemsid, String count);
  deleteCart(String itemsid, String count);
  getCount(String itemsid);
  add(index);
  delete(index);
}

class CartControllerImp extends CartController {
  MyServices myServices = Get.find();
  StatusRequest? statusRequest;
  ProductDetilesControllerImp controllerProduct =
      Get.put(ProductDetilesControllerImp());
  CartData cartData = CartData(Get.find());
  TextEditingController? controllercoupon;
  List data = [];
  List count = [];
  int couter = 0;
  List subprice = [];
  List price = [];
  int index=0;

  late ItemsModel itemsModel;
  int totalitemscount = 0;
  double subtotalpriceItem=0;
  double shipping=2.4;
  int discount=0;
  double priceOfCart=0;

  @override
  resetVarCart() {
    data.clear();
    print("===========$data");
    subprice = [];
    totalitemscount=0;
  }

  @override
  refreshPage() {
    resetVarCart();
    getCart();
  }

  getCart() async {
    update();
    statusRequest = StatusRequest.loading;
    var res =
        await cartData.getCart("${myServices.sharedPreferences.getInt("id")}");
    print("success res");
    print("${myServices.sharedPreferences.getInt("id")}");
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res["status"] == "success") {
        data.clear();
        count.clear();
        subprice.clear();
        data.addAll(res["datacart"]);
        price.clear();
        priceOfCart=0;
        for (int i = 0; i < data.length; i++) {
          count.add(res["datacart"][i]["itemscount"]);
          subprice.add(res["datacart"][i]["totalprice"]);
          price.add(res["datacart"][i]["items_price"]);
          update();
        }
        totalitemscount=count.length;
        priceOfCart=getsubTotalPrice()+shipping;
        update();
      } else {
        statusRequest = StatusRequest.nodata;
      }
    } else {
      print("fail res");
    }
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
        couter = res["data"]["itemscount"];
        return couter;
      }
    }
    update();
  }

  add(index) {
    if (count[index] < 10) {
      count[index]++;
      subprice[index]+=price[index];
      subtotalpriceItem+=price[index];
      priceOfCart+=price[index];
      if (controllerProduct.itemId != null) {
        if (data[index]["items_id"].toString() == controllerProduct.itemId) {
          controllerProduct.add(data[index]["items_id"].toString());
          print(controllerProduct.itemscount);
        } else {
          print("false count");
        }
      }
      update();
    }
  }
  getsubTotalPrice(){
    subtotalpriceItem=0;
    for(int i=0;i<subprice.length;i++){
      subtotalpriceItem+=subprice[i];
      update();
    }
    return subtotalpriceItem;

  }
  // getTotalCartPrice(){
  //   if(discount>0){
  //     priceOfCart=priceOfCart-(priceOfCart*discount/100);
  //     update();
  //   }
  //   return priceOfCart;
  // }
  delete(index) {
    if (count[index] > 0) {
      count[index]--;
      subprice[index]-=price[index];
      subtotalpriceItem-=price[index];
      priceOfCart-=price[index];
      if (controllerProduct.itemId != null) {
        if (data[index]["items_id"].toString() == controllerProduct.itemId) {
          controllerProduct.delete(data[index]["items_id"].toString());
          print(controllerProduct.itemscount);
        }
      }
    }
    update();
  }
  checkCoupon()async{
    update();
    statusRequest = StatusRequest.loading;
    var res =
    await cartData.checkcoupon(controllercoupon!.text);
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res["status"] == "success") {
        discount=res["discount"]["coupon_discount"];
        if(discount>0){
          priceOfCart=priceOfCart-(priceOfCart*discount/100);
          update();
        }
        print("*************${res["discount"]["coupon_discount"]}");
      } else {
        statusRequest = StatusRequest.nodata;
      }
    } else {
      print("fail res");
    }
    update();
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    getCart();
    super.onInit();
  }
}
