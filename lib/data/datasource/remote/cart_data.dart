import 'package:ecommers/applinks.dart';
import 'package:ecommers/core/class/crud.dart';

class CartData{

  Crud crud;

  CartData(this.crud);
  getCart(String userid) async {
    var res = await crud.postData(AppLinks.cartView,{"users_id": userid});
    return res.fold((left) => left, (right) => right);
  }
  addCart(String itemsid,String userid,String count)async{
    var res=await crud.postData(AppLinks.cartAdd,{"items_id":itemsid,"users_id":userid,"itemscount":count});
    return  res.fold((left) =>left ,(right) =>right );
  }
  removeCart(String itemsid,String userid,String count) async{
    var res=await crud.postData(AppLinks.cartDelete,{"items_id":itemsid,"users_id":userid,"itemscount":count});
    return  res.fold((left) =>left ,(right) =>right );
  }
  getCount(String itemsid,String userid) async {
    var res = await crud.postData(AppLinks.cartGetCount, {"items_id":itemsid,"users_id":userid});
    return res.fold((left) => left, (right) => right);
  }

  checkcoupon(String couponname) async {
    var res = await crud.postData(AppLinks.checkcoupon, {"coupon_name":couponname});
    return res.fold((left) => left, (right) => right);
  }
}