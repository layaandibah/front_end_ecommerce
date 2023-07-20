import 'package:ecommers/applinks.dart';
import 'package:ecommers/core/class/crud.dart';

class MyFavoriteData {
  Crud crud;

  MyFavoriteData(this.crud);

  getFavorite(String userid) async {
    var res = await crud.postData(AppLinks.favoriteView, {"users_id": userid});
    return res.fold((left) => left, (right) => right);
  }
  removeFavorite(String itemsid,String userid)async{
    var res=await crud.postData(AppLinks.favoriteRemove,{"items_id":itemsid,"users_id":userid});
    return  res.fold((left) =>left ,(right) =>right );
  }

}
