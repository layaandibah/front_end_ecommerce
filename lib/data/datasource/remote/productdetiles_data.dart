import 'package:ecommers/applinks.dart';
import 'package:ecommers/core/class/crud.dart';

class ProductDetilesData{

  Crud crud;

  ProductDetilesData(this.crud);

  getData(String itemId)async{
    var res=await crud.postData(AppLinks.productDetiles,{"item_id":itemId});
    return  res.fold((left) =>left ,(right) =>right );
  }



}