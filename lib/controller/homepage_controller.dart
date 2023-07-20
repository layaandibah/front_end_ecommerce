import 'package:ecommers/controller/myfavorite_controller.dart';
import 'package:ecommers/controller/productdetiles_controller.dart';
import 'package:ecommers/core/class/statusrequest.dart';
import 'package:ecommers/core/constant/routes.dart';
import 'package:ecommers/core/services/services.dart';
import 'package:ecommers/data/model/items_model.dart';
import 'package:get/get.dart';

import '../core/function/handlingdata.dart';
import '../data/datasource/remote/home_data.dart';

abstract class HomePageController extends GetxController{
  goToItems(List categories,int selectedCat,String categoryId);

}
class HomePageControllerImp extends HomePageController{
  MyServices myServices=Get.find();
  String? username;
late  String lang;
 late StatusRequest statusrequest;
 HomeData homeData=HomeData(Get.find());
 List categories=[];
 List items=[];
 List<ItemsModel> itemsModel=[];
getAllCategories()async{
  statusrequest=StatusRequest.loading;
  update();
  items.clear();
  var res= await homeData.getData();
  statusrequest=handlingData(res);
  print("=======Data========");
  //فحص الفشل او النجاح بالوصول للسيرفر أو الانترنت
  if(StatusRequest.success==statusrequest){
    print("=======statusrequest========");
    //فحص الفشل بالباك اند
    if(res["status"]=="success"){
     categories.addAll(res["categories"]);
     items.addAll(res["items"]);
    }
    else
    {
      //يوجد مشكلة في الباك اند
      Get.defaultDialog(title: "51".tr,middleText: "54".tr);
    }
  }
  update();
}
  goToFavoritePage(){
  Get.delete<MyFavoriteController>();
    Get.toNamed(AppRoutes.favoritePage,arguments: {
      "itemsmodel":itemsModel
    });
  }

  intialData() {
   lang=myServices.sharedPreferences.getString("lang")!;
   getAllCategories();
   username= myServices.sharedPreferences.getString("users_name");
  }
@override
  void onInit() {
    intialData();
    super.onInit();
  }
goToItemsDetiles(String itemsid){
  Get.delete<ProductDetilesControllerImp>();
  Get.toNamed(AppRoutes.productDetilesPage,arguments:{"item_Id":itemsid});
}
  @override
  goToItems(categories,selectedCat,categoryId) {
  Get.toNamed(AppRoutes.itemsPage,arguments: {
    "categories":categories,
    "selectedCat":selectedCat,
    "catedoryid":categoryId
  });
  }

}