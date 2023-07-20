import 'package:ecommers/controller/productdetiles_controller.dart';
import 'package:ecommers/core/class/statusrequest.dart';
import 'package:ecommers/core/constant/routes.dart';
import 'package:ecommers/core/function/handlingdata.dart';
import 'package:ecommers/data/datasource/remote/items_data.dart';
import 'package:ecommers/data/model/items_model.dart';
import 'package:get/get.dart';

import '../core/services/services.dart';

abstract class ItemsController extends GetxController {
  changCat(int val, String catid);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? slectedCat;
  List items = [];
  late String categoryId;
  MyServices myServices = Get.find();
  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest? statusRequest;
  List<ItemsModel> itemsModel = [];

  getItems(String catid) async {
    statusRequest = StatusRequest.loading;
    var res = await itemsData.getData(
        catid, "${myServices.sharedPreferences.getInt("id")}");
    print("success res");
    print("${myServices.sharedPreferences.getInt("id")}");
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res["status"] == "success") {
        print("success1 res");
        items.clear();
        items.addAll(res["data"]);
        print(items);
      } else {
        statusRequest = StatusRequest.nodata;
      }
    } else {
      print("fail res");
    }
    update();
  }

  goToFavoritePage() {
    Get.toNamed(AppRoutes.favoritePage, arguments: {"itemsmodel": itemsModel});
  }

  initialData() {
    categories = Get.arguments["categories"];
    slectedCat = Get.arguments["selectedCat"];
    categoryId = Get.arguments["catedoryid"];
    getItems(categoryId);
  }

  goToProductDetiles(String itemId) {
    Get.delete<ProductDetilesControllerImp>();
    Get.toNamed(AppRoutes.productDetilesPage, arguments: {"item_Id": itemId});
  }

  @override
  changCat(val, catid) {
    slectedCat = val;
    getItems(catid);
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
