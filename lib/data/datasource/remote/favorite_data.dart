import 'package:ecommers/applinks.dart';
import 'package:ecommers/core/class/crud.dart';

class FavoriteData{

  Crud crud;

  FavoriteData(this.crud);

  addFavorite(String itemsid,String userid)async{
    var res=await crud.postData(AppLinks.favoriteAdd,{"items_id":itemsid,"users_id":userid});
    return  res.fold((left) =>left ,(right) =>right );
  }
  removeFavorite(String itemsid,String userid)async{
    var res=await crud.postData(AppLinks.favoriteRemove,{"items_id":itemsid,"users_id":userid});
    return  res.fold((left) =>left ,(right) =>right );
  }

}