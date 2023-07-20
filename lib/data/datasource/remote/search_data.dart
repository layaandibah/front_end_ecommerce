import 'package:ecommers/applinks.dart';
import 'package:ecommers/core/class/crud.dart';

class SearchData{

  Crud crud;

  SearchData(this.crud);

  getData(String itemsname)async{
    var res=await crud.postData(AppLinks.search,{"items_name":itemsname});
    return  res.fold((left) =>left ,(right) =>right );
  }

}