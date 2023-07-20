import 'package:ecommers/applinks.dart';
import 'package:ecommers/core/class/crud.dart';

class HomeData{

  Crud crud;

  HomeData(this.crud);

  getData()async{
    var res=await crud.postData(AppLinks.homepage,{});
    return  res.fold((left) =>left ,(right) =>right );
  }



}