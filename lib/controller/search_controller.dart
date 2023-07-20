import 'package:ecommers/controller/favorite_controller.dart';
import 'package:ecommers/core/constant/routes.dart';
import 'package:ecommers/data/datasource/remote/search_data.dart';
import 'package:ecommers/data/model/items_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/function/handlingdata.dart';
import '../core/services/services.dart';

abstract class SearchController extends GetxController {}

class SearchControllerImp extends SearchController {
  MyServices myServices = Get.find();
  FavoriteController controller=Get.put(FavoriteController());
  SearchData searchData = SearchData(Get.find());
  StatusRequest? statusRequest;
  List items = [];
  ItemsModel? itemsModel;
  TextEditingController? search;
  bool isSearch=false;
  goToFavoritePage(){
    Get.toNamed(AppRoutes.favoritePage,arguments: {
      "itemsmodel":itemsModel
    });
  }
  getItems(String itemsname) async {
    items.clear();
    statusRequest = StatusRequest.loading;
    var res = await searchData.getData(itemsname);
    print("success res");
    print("${myServices.sharedPreferences.getInt("id")}");
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res["status"] == "success") {
        items.clear();
        items.addAll(res["data"]);} else {statusRequest = StatusRequest.nodata;}
    } else {
      print("fail res");
    }
    update();
  }
  isChanged(String val){
    if(val.isEmpty){
      isSearch=false;
      update();
    }
  }
  goToProductDetiles(id){
    Get.toNamed(AppRoutes.productDetilesPage,arguments: {"item_Id":id});
  }
  onSearchitems(String val){
    if(val.isNotEmpty){
      isSearch=true;
      update();
    }else{
      statusRequest=StatusRequest.nodata;
      update();
    }
  }
  @override
  void onInit() {
    search=TextEditingController();
    super.onInit();
  }
}
