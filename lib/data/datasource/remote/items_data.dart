import 'package:ecommers/applinks.dart';
import 'package:ecommers/core/class/crud.dart';

class ItemsData{

  Crud crud;

  ItemsData(this.crud);

  getData(String catid,String userid)async{
    var res=await crud.postData(AppLinks.items,{"category_id":catid,"users_id":userid});
    return  res.fold((left) =>left ,(right) =>right );
  }



}